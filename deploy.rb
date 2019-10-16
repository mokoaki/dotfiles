#! /usr/bin/env ruby

# frozen_string_literal: true

require "find"
require "fileutils"

current_directory = __dir__
current_home_directory = File.join(current_directory, "home")
home_directory = ENV["HOME"]

Find.find(current_home_directory) do |manage_file_path|
  next if FileTest.directory?(manage_file_path)

  manage_relative_path = manage_file_path.sub(current_home_directory, "")
  sym_file_path = File.join(home_directory, manage_relative_path)
  sym_dir = File.dirname(sym_file_path)

  FileUtils.mkdir_p(sym_dir)

  begin
    File.symlink(manage_file_path, sym_file_path)
  rescue Errno::EEXIST
    File.delete(sym_file_path)
    retry
  end

  puts "#{File.readlink(sym_file_path).ljust(40, ' ')} <= link #{sym_file_path}"
end
