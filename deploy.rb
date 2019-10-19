#! /usr/bin/env ruby

# frozen_string_literal: true

require "find"
require "fileutils"
require "pathname"

# ~/からローカルのファイルへのリンクを張る
# 冪等性があり、既存ファイルを勝手に改変したりしないように
# 作っているつもりではある
class Deploy
  def initialize
    rc_directory = "home_rc"
    @local_rc_directory = File.expand_path(rc_directory, __dir__)
  end

  def start
    Find.find(@local_rc_directory) do |rc_file_path|
      next if File.ftype(rc_file_path) != "file"
      next if File.extname(rc_file_path) == ".temp"

      check_sym(rc_file_path)
    end
  end

  private

  def check_sym(rc_file_path)
    sym_path = sym_file_path(rc_file_path)

    if FileTest.exist?(sym_path)
      sym_exist(rc_file_path, sym_path)
    else
      sym_not_exist(rc_file_path, sym_path)
    end
  end

  def sym_exist(rc_file_path, sym_path)
    ftype = File.ftype(sym_path)

    if ftype == "link" && File.readlink(sym_path) == rc_file_path
      puts ok_message(sym_path)
    else
      puts "exist #{ftype} #{sym_path}"
    end
  end

  def sym_not_exist(rc_file_path, sym_path)
    sym_dir = File.dirname(sym_path)
    FileUtils.mkdir_p(sym_dir) unless FileTest.exist?(sym_dir)
    File.symlink(rc_file_path, sym_path)

    puts ok_message(sym_path)
  end

  def ok_message(sym_path)
    "#{File.readlink(sym_path).ljust(45, ' ')} <= link #{sym_path}"
  end

  def sym_file_path(rc_file_path)
    relative_path =
      Pathname.new(rc_file_path).relative_path_from(@local_rc_directory)
    home_directory = ENV["HOME"]
    File.expand_path(relative_path, home_directory)
  end
end

Deploy.new.start
