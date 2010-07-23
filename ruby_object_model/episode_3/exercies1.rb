def count_with_increment(start, inc)
  lambda do
    tmp = start
    start += inc
    tmp
  end
end

counter = count_with_increment(10, 5)
puts counter.call
puts counter.call
puts counter.call
puts counter.call
puts counter.call
puts counter.call
puts counter.call