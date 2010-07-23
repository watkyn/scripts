module Configuration
  
  def config
    puts "configging"
  end
  
  def self.config
    puts "self configging"
  end

  def self.included(cls)
    cls.extend(ClassMethods)
  end
  
  def self.extended(cls)
    puts "#{self} and #{cls}"
    cls.extend(ClassMethods)
  end
  
  module ClassMethods
    def class_config
      puts "classy config"
    end
  end
  
end

class GeofishrConfiguration
  include Configuration
end

class OtherConfig
  extend Configuration
  
end


gc = GeofishrConfiguration.new
oc = OtherConfig.new

gc.config
OtherConfig.config
OtherConfig.class_config
Configuration.config
GeofishrConfiguration.class_config