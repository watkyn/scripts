class Color
  
  def self.const_missing(name)
    const_set(name, new)
  end
  
end

puts Color::Red
puts Color::Blue

puts Color::Red == Color::Red
puts Color::Blue == Color::Blue
puts Color::Red == Color::Blue