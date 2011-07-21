
# instance_eval takes a block and changes self when explicit reciever given, creating a singleton class an putting any new methods in there

class Stuff
  def initialize
    @var = 345
  end
  
  private 
  
  def secret
    puts "calling private method"
  end
end

s = Stuff.new
s.instance_eval do #can now access instance var and private
  puts @var
  secret # private methods must be called without a reciever
end

#instance_eval puts any new methods into the singleton class
s.instance_eval do
  def bark
    puts 'ruff ruff'
  end
  def self.hello  # adding self does not seem to have an effect (unnecessary)
    puts 'hi'
  end
end
s.bark

Stuff.instance_eval do
  def squeak
    puts 'beep beep'
  end
end
Stuff.squeak


# you can also pass a string to instance_eval instead of a block
s.instance_eval("puts @var; secret")


#how self changes with instance_eval and the pitfalls of that
class Sneaky
  def sneak_peek(stuff)
    old_self = self
    stuff.instance_eval do
      puts @var
      secret
      old_self.abort
    end
  end
  def abort
    puts 'should not have peeked'
  end
end

sneaker = Sneaky.new
sneaker.sneak_peek(s)