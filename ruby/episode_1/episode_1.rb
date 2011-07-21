class Silly
  def method_one
    yield
    puts self
  end
  
  def method_two
    
  end
end

s = Silly.new
s.method_one do
  puts self
end

animal = "cat"

puts self
def animal.speak
  puts "hello"
  puts "my self is #{self}"
  hello
end

def hello
  puts "me is #{self}"
end

animal.speak
hello

@@animal = ""

puts defined?(@@animal)

# puts "starting IKE"
# class Ike
#   puts "self is #{self}"
#   
#   class << self
#     puts "self is #{self}"
#   end
#   
#   def hello
#     puts "self is #{self}"
#   end
#   
#   def self.help
#     puts "self is #{self}"
#   end
# end
# 
# Ike.new.hello
# Ike.help
# 
# puts Ike.singleton_methods
# puts Ike.instance_methods(false)
# puts Ike.methods(false)
