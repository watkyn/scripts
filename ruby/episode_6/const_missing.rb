class Module

  def const_missing(const)
    puts const
  end

end

# the reason Dave needs to use self.const_missing is that
# Dave inherits from Class which inherits from Module.
# Dave needs to put const_missing into the hierarchy my using self. which
# creates a singleton class for the Dave object.
# super would then call the const_missing from Module
class Dave
  
  def self.const_missing(const)
    puts "hi from Dave #{const}"
    super
  end

end


HiThere
Dave::Dude
