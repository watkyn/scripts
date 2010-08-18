module Memoizer

  def memoize(method)
    @memory ||= {}

    alias method :tempy
    puts 'memoized is finished'

    remove_method(method)
  end


  def tempy
    puts "hello #{@memory}"
  end

end
