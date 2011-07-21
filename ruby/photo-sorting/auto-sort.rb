# add a "D" at the beginning of the file
require 'rubygems'
require 'fileutils'

Dir.glob("*").each do |file|
  FileUtils.mv(file, "D#{file}")
end


