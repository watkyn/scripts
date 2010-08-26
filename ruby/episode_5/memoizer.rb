module Memoizer

  def memoize(method, &blck)
    define_method(method, &blck)
    old_meth = instance_method(method)
    define_method method do |*args|
      @memory ||= {}
      if @memory[args] == nil
        @memory[args] = old_meth.bind(self).call(*args)
      end
      @memory[args]
    end
  end

end
