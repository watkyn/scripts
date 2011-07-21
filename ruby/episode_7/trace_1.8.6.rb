module Trace
  
  def self.included(klass)
    def klass.method_added(name)
      return if @_adding_method_right_now
      @_adding_method_right_now = true
      Trace.wrap_method(name, self)
      @_adding_method_right_now = false
    end
  end

  def self.wrap_method(method_name, klass)
    orig_method = "_orig_#{method_name}_"
    method_body = %{
      alias_method :#{orig_method}, :#{method_name}
      def #{method_name}(*args, &block)
        puts "==> calling #{method_name} with \#{args.inspect}"
        result = send(:#{orig_method}, *args, &block)
        puts "<== result is \#{result}"
        result
      end
    }
    puts method_body
    klass.class_eval method_body
  end

end

class TraceExample
  include Trace

  def some_method(arg1, arg2)
    puts "the real some_method"
    arg1 + arg2
  end
  
  def with_block(arg, &block)
    puts "the real with_block"
    block.call * arg
  end

  def name=(new_name)
    @name = new_name
  end

end

ex = TraceExample.new
ex.some_method(2, 3)
ex.with_block(4) { 3 }

