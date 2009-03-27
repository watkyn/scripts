
def deleteDir(dir)
    Dir.chdir(dir)
    Dir.foreach(dir) do |file|
        if file != "." and file != ".."
            if File.directory?(file)
                deleteDir("#{dir}/#{file}")
            else
                puts "delete file #{file}"
                File.delete(file)
            end
        end
    end
    Dir.chdir("..")
    puts "delete directory #{dir}"
    Dir.delete(dir)
end

def processDir(dir)
    #puts "Processing directory #{dir}"
    Dir.chdir(dir)
    Dir.foreach(dir) do |file|
        if File.directory?(file)
            if file == "CVS"
                puts "Deleting directory #{dir}/#{file}"
                deleteDir("#{dir}/#{file}")
            elsif file != "." and file != ".."
                processDir("#{dir}/#{file}")
            end
        end
    end
    Dir.chdir("..")
end

#this is the dir to clean
dir_to_clean = '/Users/Tony/work/alrd/idexx-web-libraries'

puts "Working directory: #{dir_to_clean}"
processDir(dir_to_clean)
