module Configuration
  
  def config
    puts "instance method"
  end
  

  def self.included(cls)
    cls.extend(ClassMethods)
  end
  
  module ClassMethods
    def class_config
      puts "class method"
    end
  end
  
end

class GeofishrConfiguration
  include Configuration
  
  def self.cls_config
    puts "calling class config"
    class_config
  end
  
  
end



gc = GeofishrConfiguration.new
gc.config

GeofishrConfiguration.cls_config