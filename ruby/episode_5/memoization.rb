require 'memoizer'

class Discounter
  extend Memoizer


  def initialize
    @cached_values = {}
  end

  def discount(*skus)
    discount_calc(skus)
  end

  def discount_calc(skus)
    sum = skus.inject { |sum, x| sum += x }
    puts "Expensive calculations for #{sum}"
    return sum
  end

  memoize :discount_calc
end


d = Discounter.new
puts d.discount(1)
puts d.discount(5, 2, 3)
puts d.discount(5, 2, 3)
puts d.discount(5, 2, 3)
puts d.discount(3, 4, 5)

