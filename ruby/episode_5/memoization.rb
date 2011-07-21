require 'memoizer'

class Discounter
  extend Memoizer

  memoize :discount do |*skus|
    sum = skus.inject { |sum, x| sum += x }
    puts "Expensive calculations for #{sum}"
    sum
  end

end


d = Discounter.new
puts d.discount(1)
puts d.discount(5, 6, 78)
puts d.discount(5, 6, 78)
puts d.discount(5, 6, 78)
puts d.discount(5, 6, 78)
puts d.discount(5)
puts d.discount(5)
puts d.discount(3)

