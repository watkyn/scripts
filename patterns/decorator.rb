# The Decorator pattern the java way (in ruby)

class Person
  def list_clothing
    puts "wearing shoes"
  end
  
  def say_something_clever
    puts "To love oneself is the beginning of a lifelong romance."
  end
  
  def make_the_most_of_it
    puts "I always do my best and nothing less."
  end
end

class PersonDecorator
  def initialize(person)
    @person = person
  end
end

class PersonWithHat < PersonDecorator
  def list_clothing
    @person.list_clothing
    puts " and wearing a hat"
  end
  
  def say_something_clever
    @person.say_something_clever
  end
  
  def make_the_most_of_it
    @person.make_the_most_of_it
  end
end

class PersonWithWisdom < PersonDecorator
  def list_clothing
    @person.list_clothing
  end
  
  def say_something_clever
    @person.say_something_clever
    puts " Copying from a single source is plagiarism, copying from multiple source is research."
  end
  
  def make_the_most_of_it
    @person.make_the_most_of_it
  end
end


puts "Java idioms work ..."
person = Person.new
hp = PersonWithHat.new(person)
wp = PersonWithWisdom.new(hp)

wp.list_clothing
wp.say_something_clever
wp.make_the_most_of_it



# now an example of Decorator using more ruby idioms

module RubyHatDecorator  
  def list_clothing
    super
    puts " and wearing bell bottoms"
  end
end

module RubyCleverDecorator
  def say_something_clever
    super
    puts " Ruby is as ruby does."
  end
end

puts ""
puts "but Ruby idioms or always more concise."
wp.extend(RubyHatDecorator)
person.extend(RubyCleverDecorator) #insert the decorator module anywhere you want in the chain

wp.list_clothing
wp.say_something_clever
wp.make_the_most_of_it