require 'find'
require 'fileutils'

current_directory = File.join(__dir__, 'home')
home_directory = ENV['HOME']

Find.find(current_directory) do |manage_file_path|
  next if FileTest.directory?(manage_file_path)

  manage_relative_path = manage_file_path.sub(current_directory, '')
  sym_file_path = File.join(home_directory, manage_relative_path)
  sym_dir = File.dirname(sym_file_path)

  FileUtils.mkdir_p(sym_dir)
  File.delete(sym_file_path)
  File.symlink(manage_file_path, sym_file_path)

  p "#{manage_file_path} <= #{sym_file_path}"
end

'ok'
