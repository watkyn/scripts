require 'rubygems'
require 'spoon'

#attempting to execute a shell script and then let the process terminate
#the shell script should then execute and restart this process
#it should repeat until broken by the user

puts 'Beginning the ruby process again #{$$}'
sleep(1) #allow for the shell script to complete 

5.times do 
  open('log.txt', 'a') { |f| f.puts "doing some work" }
  sleep(1)
end

Spoon.spawnp("./update.sh")
