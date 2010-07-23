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