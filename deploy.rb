#! /usr/bin/env ruby

# frozen_string_literal: true

require "find"
require "fileutils"
require "pathname"
require "forwardable"

########################################
# ~/xxxxx/yyyyy
# から
# dotfiles/home_rc/xxxxx/yyyyy
# へのシンボリックリンクを張る
########################################
class Deploy
  HOME_RC_DIRECTORY = "./home_rc"

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

  def local_rc_directory
    @local_rc_directory ||= File.expand_path(HOME_RC_DIRECTORY, __dir__)
  end

  def rc_files
    @rc_files ||= Find.find(local_rc_directory)
                      .select { |path| File.ftype(path) == "file" }
                      .reject { |path| path.end_with?(".temp") }
                      .map { |path| RcFile.new(path, self) }
  end

  def add_log(flg, msg)
    logs[flg] << msg
  end

  ########################################
  # dotfiles/home_rc/xxxxx 毎のobject
  # いくつあってもよい
  # サブディレクトリ以下に配置してもよい
  ########################################
  class RcFile
    extend Forwardable

    attr_reader :path

    def initialize(path, deploy)
      @path = path
      @deploy = deploy
    end

    def_delegator :@deploy, :local_rc_directory
    def_delegator :@deploy, :rc_files
    def_delegator :@deploy, :add_log

    def start!
      symlink_file = SymlinkFile.new(symlink_file_path, self)
      symlink_file.start!
    end

    private

    # dotfiles/home_rc/xxxxx 配下のディレクトリ構造を再現し
    # homeディレクトリに配置されるシンボリックリンク毎のobject
    def symlink_file_path
      relative_path = Pathname.new(path)
                              .relative_path_from(local_rc_directory)
      File.expand_path(relative_path, Dir.home)
    end

    ########################################
    # ~/xxxxx 毎のObject
    ########################################
    class SymlinkFile
      extend Forwardable

      attr_reader :path
      attr_reader :rc_file

      def initialize(path, rc_file)
        @path = path
        @rc_file = rc_file
      end

      def_delegator :rc_file, :add_log
      def_delegator :rc_file, :rc_files

      def start!
        if exist?
          self_exist!
        else
          self_not_exist!
        end
      end

      private

      def link_path
        File.readlink(path)
      end

      def ftype
        File.ftype(path)
      end

      def link?
        ftype == "link"
      end

      def exist?
        # シンボリックリンクは存在していているが
        # リンク先が存在しないだけかもしれないので両方チェック
        FileTest.exist?(path) || FileTest.symlink?(path)
      end

      def base_dir
        @base_dir ||= File.dirname(path)
      end

      def self_exist!
        if link? && (link_path == rc_file.path)
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
        symlink_str = link_path.ljust(rc_files.map(&:path).map(&:size).max, " ")
        "#{symlink_str} <= #{ftype} #{path}"
      end
    end
  end
end

Deploy.new.start!
