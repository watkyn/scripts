module Accessor

  def my_attr(name)
    ivar_name = "@#{name}"
    define_method(name) do
      puts "getting #{name}"
      instance_variable_get(ivar_name)
    end
    
    define_method("#{name}=") do |val|
      puts "setting #{name} = #{val}"
      instance_variable_set(ivar_name, val)
    end
  end
  
end


class Tony
  extend Accessor
  
  my_attr :mindy
end

t = Tony.new
t.mindy = "wife"
puts t.mindy