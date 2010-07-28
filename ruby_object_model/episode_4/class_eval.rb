
#class_eval (aka module_eval) can only be called on classes and modules
# new methods defined with class_eval will be put in the class

String.class_eval do
  def me
    puts "tony"
  end
  def self.dude # self here will have an effect unlike instance_eval
    puts "does this put this in the singleton class?"
  end
end
"tony".me
String.dude

# can pass in a string instead of a block also
String.class_eval("puts self")

#could use define_method inside class_eval

def add_method_to_String(method)
  String.class_eval do
    define_method(method) do
      puts method
    end
  end
end

add_method_to_String(:willy)
add_method_to_String(:frost)

"timmy".willy
"jack".frost