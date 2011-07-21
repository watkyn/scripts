class BeforeTraceObject
  def any_method(*args, &block)
    puts "any method"
  end
end

module Trace

  def self.included(klass)
    klass.const_set(:HASHY, {})
    klass.instance_methods(false).each do |method|
      wrap_method(method, klass)
    end
    def klass.method_added(name)
      return if @_adding_method_right_now
      @_adding_method_right_now = true
      Trace.wrap_method(name, self)
      @_adding_method_right_now = false
    end
  end

  def self.wrap_method(method_name, klass)
    klass.const_get(:HASHY)[method_name.to_sym] = klass.instance_method(method_name)
    method_body = %{
      def #{method_name}(*args, &block)
        puts "==> calling #{method_name} with \#{args.inspect}"
        result = HASHY[:#{method_name}].bind(self).call(*args, &block)
        puts "<== result is \#{result}"
        result
      end
    }
    klass.class_eval method_body
  end

end

class BeforeTraceObject
  include Trace
end

b = BeforeTraceObject.new
b.any_method(1)

#class TraceExample
  #include Trace

  #def self.classer(arg)
    #puts arg
  #end

  #def some_method(arg1, arg2)
    #puts "the real some_method"
    #arg1 + arg2
  #end
  
  #def with_block(arg, &block)
    #puts "the real with_block"
    #block.call * arg
  #end

  #def name=(new_name)
    #@name = new_name
  #end

#end

#TraceExample.classer("hello there")
#ex = TraceExample.new
#ex.some_method(2, 3)
#ex.with_block(4) { 3 }
#ex.name = "tony"
