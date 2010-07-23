x = lambda { |a| a + 1 }
y = Proc.new { |a| a + 1 }

puts x.call(99)
puts y.call(2)

def convert(&blck)  # uses proc.new
  blck
end

z = convert { |a| a + 1 }
puts z.call(34)


#differences between Proc.new and lamba
puts ""
puts "proc and lamba params"

# defaults unspecified params to nil, extra ones ignored
x = Proc.new { |a,b,c| puts a, b, c }
x.call(1, 2, 3)
x.call(1, 2)
x.call(1)
x.call
x.call(1, 2, 3, 45, 6, 7, 8)

#requires all parameters explicitly with correct number of args
y = lambda { |a,b,c| puts a, b, c }
y.call(1, 2, 3)
# y.call(1, 2) # will give error

puts ''
puts "how do they handle returns"
puts ''

puts 'Proc will exit from the enclosing method'
def tester_proc
  puts "at top"
  Proc.new { return }.call
  puts "at end"
end
puts "before proc call"
tester_proc 
puts "after proc call"

puts ''
puts 'lambda will return from the block and continue'
def tester_lambda
  puts "at top"
  lambda { return }.call
  puts "at end"
end
puts "before proc call"
tester_lambda
puts "after proc call"



