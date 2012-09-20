module Mod
  #extend self
  def one
    puts "This is one"
  end
  module_function :one
end

class Cls
  include Mod
  
  def call_one
    one
  end
end

Mod.one     #=> "This is one"
c = Cls.new
c.call_one  #=> "This is one"

module Mod
  def one
    puts "This is the new one"
  end
end

Mod.one     #=> "This is one"
c2 = Cls.new
c2.call_one  #=> "This is one"
c.call_one
