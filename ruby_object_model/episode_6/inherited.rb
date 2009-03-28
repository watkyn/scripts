class Parent
  def self.inherited(child)
    puts "#{child} inherting from #{self}"
  end
end

class Child < Parent
  def self.inherited(child)
    puts "inheriting from down the chain"
  end
end

class GrandChild < Child  
end

class GreatGrandChild < GrandChild
end

