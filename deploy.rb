#! /usr/bin/env ruby

# frozen_string_literal: true

require "find"
require "fileutils"
require "pathname"

# ~/からローカルのファイルへのリンクを張る
# 冪等性があり、既存ファイルを勝手に改変したりしないように
# 作っているつもりではある
class Deploy
  def start
    rc_file_pathes.each do |rc_file_path|
      check_symlink(rc_file_path)
    end

    # インスタンス変数を消しておく　なんとなく
    instance_variables.each { |ins_val| remove_instance_variable(ins_val) }
  end

  private

  def home_rc_directory
    "home_rc"
  end

  def global_home_directory
    @global_home_directory ||= ENV["HOME"]
  end

  def local_rc_directory
    @local_rc_directory ||= File.expand_path(home_rc_directory, __dir__)
  end

  def rc_file_pathes
    @rc_file_pathes ||= Find.find(local_rc_directory)
                            .select { |path| File.ftype(path) == "file" }
                            .reject { |path| File.extname(path) == ".temp" }
  end

  def check_symlink(rc_file_path)
    symlink_path = symlink_file_path(rc_file_path)

    if FileTest.exist?(symlink_path)
      symlink_file_exist(rc_file_path, symlink_path)
    else
      symlink_file_not_exist(rc_file_path, symlink_path)
    end
  end

  def symlink_file_exist(rc_file_path, symlink_path)
    ftype = File.ftype(symlink_path)

    if ftype == "link" && File.readlink(symlink_path) == rc_file_path
      puts ok_message(symlink_path)
    else
      puts "exist #{ftype} #{symlink_path}"
    end
  end

  def symlink_file_not_exist(rc_file_path, symlink_path)
    symlink_dir = File.dirname(symlink_path)
    FileUtils.mkdir_p(symlink_dir) unless FileTest.exist?(symlink_dir)
    File.symlink(rc_file_path, symlink_path)

    puts ok_message(symlink_path)
  end

  def ok_message(symlink_path)
    symlink_link = File.readlink(symlink_path)
                       .ljust(@rc_file_pathes.map(&:size).max, " ")
    "#{symlink_link} <= link #{symlink_path}"
  end

  def symlink_file_path(rc_file_path)
    relative_path = Pathname.new(rc_file_path)
                            .relative_path_from(local_rc_directory)
    File.expand_path(relative_path, global_home_directory)
  end
end

Deploy.new.start
