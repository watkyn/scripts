module Trace
  
  def self.included(klass)
    def klass.method_added(name)
      return if @_adding_method_right_now
      @_adding_method_right_now = true
      old_method = self.instance_method(name)
      
      class_eval %{
        def #{name}(*args, &block)
          puts "==> calling #{name} with #{args.inspect}\"
          result = old_method.bind(self).call(*args, &block)
          puts "<== result is #{result}"
          result
        end
      }
      @_adding_method_right_now = false
    end
  end

end

class TraceExample
  include Trace

  def some_method(arg1, arg2)
    arg1 + arg2
  end
  
  def with_block(arg, &block)
    block.call * arg
  end

end

ex = TraceExample.new
ex.some_method(2, 3)
ex.with_block(4) { 3 }

