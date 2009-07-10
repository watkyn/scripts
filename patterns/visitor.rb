# example of the visitor pattern pretending ruby is like java

# The class hierachy that needs additional functionality needs to have an Accept method
# that takes a pre-defined interface.  This is the main problem, the designer has to build Visitor in up front for it to work
# with languages like Java.
module TreeVisitor  
  def visit(tree)
    # do nothing since this is just the java interface that would be
  end  
end

# have you ever had pure maple sap?
class SyrupVisitor
  include TreeVisitor
  
  def visitOak(oak)
    puts "#{oak.gatherAcorns} is stupid!"
  end
  def visitAsh(ash)
    puts "#{ash.eatAshBoringBeetle} is gross!"
  end
  def visitSugarMaple(maple)
    puts "#{maple.drinkingSyrup} is better than any energy drink I have ever had!"
  end
end

# storing nuts for the winter
class SquirrelVisitor
  include TreeVisitor
  
  def visitOak(oak)
    puts "#{oak.gatherAcorns} is what I do to survive!"
  end
  def visitAsh(ash)
    puts "#{ash.eatAshBoringBeetle} can be OK, if you are starving to death!"
  end
  def visitSugarMaple(maple)
    puts "#{maple.drinkingSyrup} is impossible for me most of the time!"
  end
end

# storing nuts for the winter
class CrowVisitor
  include TreeVisitor
  
  def visitOak(oak)
    puts "#{oak.gatherAcorns} is pointless!"
  end
  def visitAsh(ash)
    puts "#{ash.eatAshBoringBeetle} makes you grow black hair on your chest!"
  end
  def visitSugarMaple(maple)
    puts "#{maple.drinkingSyrup} does not do anything for me unless it is fermented!"
  end
end


# these classes do not share the object hierarchy on purpose to show 
# how visitor is used to visit a heterogeneous hierarchy (in java for instance)
class Oak
  def accept(visitor)
    visitor.visitOak(self)
  end
  def gatherAcorns     
    puts 'gathering acorns'
  end
end

class Ash
  def accept(visitor)
    visitor.visitAsh(self)
  end
  def eatAshBoringBeetle
    puts "eating ash boring beetles"
  end
end

class SugarMaple
  def accept(visitor)
    visitor.visitSugarMaple(self)
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

