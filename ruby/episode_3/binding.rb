def example(param)
  lvar = "example local var"
  binding
end

puts example("hi there")
puts example("hi there")
puts binding


b = class FunkyMunky
  
  
  binding
end

eval "def tony; puts 'dude is cool'; end", b
eval "def mindy; puts 'dudette is cool'; end"

FunkyMunky.new.tony
mindy

puts ''
puts 'ruby associates a binding with every block it creates'
puts 'so a block can be used as a binding as well'

def x_times(n)
  lambda { |val| n * val }
end
three_times = x_times(3)
puts three_times.call(45)
puts eval "n", three_times
