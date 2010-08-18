require 'memoizer'

class Discounter
  extend Memoizer

  memoize :discount_calc

  def initialize
    @cached_values = {}
  end

  def discount(*skus)
    if respond_to?(:discount_calc)
      puts "yes"
    else 
      tempy
    end
  end

  def discount_calc(skus)
    sum = skus.inject { |sum, x| sum += x }
    puts "Expensive calculations for #{sum}"
    return sum
  end
end


d = Discounter.new
puts d.discount(1)
puts d.discount(5, 2, 3)
puts d.discount(5, 2, 3)
puts d.discount(5, 2, 3)
puts d.discount(3, 4, 5)

