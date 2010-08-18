module Memoizer

  def memoize(method)

    old_meth = self.instance_method(method)

    define_method :discount_calc do |skus|
      @memory ||= {}
      if @memory[skus] == nil
        @memory[skus] = old_meth.bind(self).call(skus)
      end
      @memory[skus]
    end
  end

end
