class Example
  def one
    puts "one #{self}"
    def two
      puts "two #{self}"
    end
  end  
end

e = Example.new
e.one
e.two

f = Example.new
f.two


# define_method only available in modules and classes

module Plug

  def self.included(cls)
    def cls.create_multiplier(name)
      define_method(name) do |val|
        val * 2
      end
    end    
    cls.create_multiplier :tony
    cls.create_multiplier :mindy
    cls.create_multiplier :anthony
  end

  
end

class Jones 
  include Plug
  
  create_multiplier :jones
end
j = Jones.new
puts j.jones(2)
puts j.tony(3)
puts j.mindy(4)
puts j.anthony(5)

