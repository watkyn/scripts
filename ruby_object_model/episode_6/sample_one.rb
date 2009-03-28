class Module
  def included(mod)
    puts "including..."
  end
end

class SomeClass
  include Comparable
  
  def <=>(other)  
    puts "comparing..."
    0
  end

end


s = SomeClass.new
s < 1