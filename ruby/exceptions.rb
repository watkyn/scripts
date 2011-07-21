require "English"

class MyError < StandardError; end

me = MyError.new("what is up with that anyway?")
puts me.message
puts me.backtrace


class Stacker
  def add_to_stack
    raise MyError.new("this one should have a backtrace")
  end
end

begin 
  Stacker.new.add_to_stack
rescue => ex
  puts ex.backtrace
end


# raise "this is just some error" #raise any old RuntimeError with this message


class TrickingOutRaise
  def exception
    puts "I guess this works as long as I return an Exception here"
    MyError.new
  end
end

begin raise TrickingOutRaise.new; rescue; end

begin raise MyError, "what is up"; rescue; end  #using the two argument method of raise

begin 
  raise MyError, "what is up", %w{tony mindy anthony nathaniel dahlia julia jordan}
rescue => ex
  puts ex.backtrace.join(" ")
end  #using the three argument method that has backtrace


#using error info
begin
  raise "type fu"
rescue
  puts "found type fu #{$ERROR_INFO}"
  puts $!
end

puts $!

# scope of rescue block variables
begin
  raise "too bad the rescue block does not scope the exception"
rescue => bad
  puts bad
end
puts bad
puts $!


#by default the StandardError hierarchy is caught but not above that
begin 
  raise Exception
rescue Exception # needed here explicitly
  puts $!
end

begin 
  puts "make sure to take out the trash"
  #even if I return from here the ensure will still execute
ensure
  puts "trash taken out"
end


# how to use else
begin 
  puts "hello"
rescue
  puts 'to the rescue'
else #else will be outside of the block that checks for exceptions
  puts "in the else"
end


# using a method def instead of the begin keyword
def potentially_harmful
  raise MyError, "this is inside of a method"
rescue
  puts "#{$!} to the rescue"
ensure
  puts "alwasys should clean up after myself, as I was taught"
end
potentially_harmful

#defining classes or modules can also use the same constructs
class ExampleStuff
  
  raise "this is the way a class could raise a RuntimException"
  
rescue
  puts "but it i catch the error then we are good #{$!}"
end

def will_raise
  raise 'every time i will raise one'
end

#rescue as a statement modifier
x = will_raise rescue 12
puts x
