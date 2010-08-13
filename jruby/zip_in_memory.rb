require 'java'
require 'zlib'
require 'archive/tar/minitar'

zip_file_name = "/Users/Tony/work/dx-portal/com.idexx.dxportal.updater/test/resources/sample.tar.bz"
#zip_file_name = '/tmp/aj.txt'
#zip_file = open(zip_file_name, 'r')

#`tar -xf #{zip_file_name}` 

Zlib::GzipReader.open(zip_file_name) do |f|
  print gz.read
  gz.close
end


#File.open("/tmp/tony.zip", 'w') do |f|
  #f.puts zip_file.read
#end

        
