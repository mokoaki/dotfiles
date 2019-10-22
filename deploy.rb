#! /usr/bin/env ruby

# frozen_string_literal: true

require "find"
require "fileutils"
require "pathname"

########################################
# ~/xxxxx/yyyyy
# から
# dotfiles/home_rc/xxxxx/yyyyy
# へのシンボリックリンクを張る
########################################
class Deploy
  attr_reader :logs

  def start!
    # インスタンス変数を全消去
    instance_variables.each { |ins_val| remove_instance_variable(ins_val) }

    @logs = { success: [], error: [] }

    puts "= START"
    rc_files.each(&:start!)
    puts logs.values
    puts "= FINISH"

    exit logs[:error].empty?
  end

  def home_rc_directory
    "home_rc"
  end

  def global_home_directory
    @global_home_directory ||= ENV["HOME"]
  end

  def local_rc_directory
    @local_rc_directory ||= File.expand_path(home_rc_directory, __dir__)
  end

  def rc_files
    @rc_files ||= Find.find(local_rc_directory)
                      .select { |path| File.ftype(path) == "file" }
                      .reject { |path| File.extname(path) == ".temp" }
                      .map { |rc_file_path| RcFile.new(rc_file_path, self) }
  end

  def add_log(flg, msg)
    logs[flg] << msg
  end

  ########################################
  # dotfiles/home_rc/xxxxx 毎のObject
  ########################################
  class RcFile
    attr_reader :path
    attr_reader :deploy

    def initialize(path, deploy)
      @path = path
      @deploy = deploy
    end

    def start!
      symlink_file = SymlinkFile.new(symlink_file_path, self)
      symlink_file.start!
    end

    def rc_files
      deploy.rc_files
    end

    def add_log(*params)
      deploy.add_log(*params)
    end

    private

    def symlink_file_path
      relative_path = Pathname.new(path)
                              .relative_path_from(deploy.local_rc_directory)
      File.expand_path(relative_path, deploy.global_home_directory)
    end
  end

  ########################################
  # ~/xxxxx 毎のObject
  ########################################
  class SymlinkFile
    attr_reader :path
    attr_reader :rc_file

    def initialize(path, rc_file)
      @path = path
      @rc_file = rc_file
    end

    def start!
      if exist?
        self_exist!
      else
        self_not_exist!
      end
    end

    private

    def link_path
      raise "SymlinkFile#link_path [#{ftype}] [#{path}]" if ftype != "link"

      File.readlink(path)
    end

    def ftype
      raise "SymlinkFile#ftype [No such file] [#{path}]" if exist? == false

      File.ftype(path)
    end

    def exist?
      FileTest.exist?(path) || FileTest.symlink?(path)
    end

    def base_dir
      @base_dir ||= File.dirname(path)
    end

    def self_exist!
      if (ftype == "link") && (link_path == rc_file.path)
        add_log(:success, ok_message)
      else
        add_log(:error, "== ERROR exist #{path} [#{ftype}]")
      end
    end

    def self_not_exist!
      FileUtils.mkdir_p(base_dir)
      File.symlink(rc_file.path, path)
      add_log(:success, ok_message)
    rescue StandardError => e
      add_log(:error, "== ERROR mkdir #{base_dir} [#{e.message}]")
    end

    def ok_message
      rc_files_path_max_length = rc_file.rc_files.map(&:path).map(&:size).max
      symlink_str = link_path.ljust(rc_files_path_max_length, " ")
      "#{symlink_str} <= #{ftype} #{path}"
    end

    def add_log(*params)
      rc_file.add_log(*params)
    end
  end
end

Deploy.new.start!
