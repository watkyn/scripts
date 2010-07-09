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

puts self


animal = "cat"

puts self
def animal.speak
  puts "hello"
  puts "my self is #{self.methods.grep(/speak/)}"
  hello
end

def hello
  puts "me is #{self}"
end

@@animal = ""

puts defined?(@@animal)



class Ike
  
  puts "self is #{self}"
  
  def hello
    puts "self is #{self}"
  end
  
  def self.help
    puts "self is #{self}"
  end
  
end

Ike.new.hello
Ike.help

puts Ike.singleton_methods
puts Ike.instance_methods(false)
puts Ike.methods(false)
