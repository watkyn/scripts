module Mathy
  puts self
  class << self
    puts self
    
    def crap
      puts self
      puts "no"
    end
    
  end
  
  
  def self.isNumber
    puts self
    puts "yes"
  end
  
end

Mathy.isNumber
Mathy.crap

puts Mathy.instance_methods
puts Mathy.singleton_methods

# module Logger
#     
#   def log(message)
#     STDERR.puts message
#   end
#   
# end
# 
# 
# class Truck
#   include Logger
# end
# 
# class Ship
#   include Logger
# end
# 
# 
# Truck.new.log("hello")
# Ship.new.log("ships")
