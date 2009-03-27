#proof positive that class methods are inherited and can be overridden.  Take that Java!

class Milo

  def self.hi
    puts "Milo says hi"
  end
  
end


class Otis < Milo
  
  def self.hi
    super
    puts 'Otis says hello'
  end
  
  
end


Milo.hi

Otis.hi