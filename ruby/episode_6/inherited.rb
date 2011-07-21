class Parent
  def self.inherited(child)
    puts "#{child} inherting from #{self}"
  end
end

class Child < Parent
end

class GrandChild < Child  
end

class GreatGrandChild < GrandChild
end

