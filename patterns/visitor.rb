# example of the visitor pattern pretending ruby is like java

# The class hierachy that needs additional functionality needs to have an Accept method
# that takes a pre-defined interface.  This is the main problem, the designer has to build Visitor in up front for it to work
# with languages like Java.


# pretending to be a java interface
module TreeVisitor  
  def visit(tree)
  end
end

# have you ever had pure maple sap?
class SyrupVisitor
  include TreeVisitor
  
  def visit(tree)
    if tree.is_a? Oak
      puts "#{tree.gatherAcorns} is stupid!"
    elsif tree.is_a? Ash
      puts "#{tree.eatAshBoringBeetle} is gross!"
    elsif tree.is_a? SugarMaple
      puts "#{tree.drinkingSyrup} is better than any energy drink I have ever had!"
    end
  end
end

# storing nuts for the winter
class SquirrelVisitor
  include TreeVisitor
  
  def visit(tree)
    if tree.is_a? Oak
      puts "#{tree.gatherAcorns} is what I do to survive!"
    elsif tree.is_a? Ash
      puts "#{tree.eatAshBoringBeetle} can be OK, if you are starving to death!"
    elsif tree.is_a? SugarMaple
      puts "#{tree.drinkingSyrup} is impossible for me most of the time!"
    end
  end
end

# eating bugs with a stick
class CrowVisitor
  include TreeVisitor
  
  def visit(tree)
    if tree.is_a? Oak
      puts "#{tree.gatherAcorns} is pointless!"
    elsif tree.is_a? Ash
      puts "#{tree.eatAshBoringBeetle} makes you grow black hair on your chest!"
    elsif tree.is_a? SugarMaple
      puts "#{tree.drinkingSyrup} does not do anything for me unless it is fermented!"
    end
  end
end


# these classes do not share the object hierarchy on purpose to show 
# how visitor is used to visit a heterogeneous hierarchy (in java for instance)
class Oak
  def accept(visitor)
    visitor.visit(self)
  end
  def gatherAcorns     
    puts 'gathering acorns'
  end
end

class Ash
  def accept(visitor)
    visitor.visit(self)
  end
  def eatAshBoringBeetle
    puts "eating ash boring beetles"
  end
end

class SugarMaple
  def accept(visitor)
    visitor.visit(self)
  end
  def drinkingSyrup
    puts "drinking pure maple sap"
  end
end

syrupGuy = SyrupVisitor.new
sq = SquirrelVisitor.new
crow = CrowVisitor.new

oak = Oak.new
ash = Ash.new
maple = SugarMaple.new

puts "syrup guy says:"
oak.accept(syrupGuy)
ash.accept(syrupGuy)
maple.accept(syrupGuy)

puts ""

puts "happy jack says:"
oak.accept(sq)
ash.accept(sq)
maple.accept(sq)

puts ""

puts "crow says:"
oak.accept(crow)
ash.accept(crow)
maple.accept(crow)

