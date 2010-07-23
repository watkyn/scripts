class String
  def speak
    puts "from string"
  end
end

animal = "cat"
animal.speak

def animal.speak
  puts "cat speaks"
  super
end

animal.speak

other = animal.clone

def other.speak
  puts "other speaks"
  super
end

other.speak


Billy = other.clone

Billy.