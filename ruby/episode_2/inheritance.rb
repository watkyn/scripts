class Formatter
  def initialize(text)
    @text = text
  end
  
  def to_html
    fail "subclasses need to implement to_html"
  end
  
end

class TextFormatter < Formatter
  def to_html
    
  end
end

TextFormatter.new("hi").to_html


animal = "dog"

class << animal
  def speak
    puts "woof"
  end
end

animal.speak


class Person
  @count = 4
  class << self
    attr_accessor :count
  end
  
  def initialize
    Person.count += 1
  end
  
end

Person.new
puts Person.count

