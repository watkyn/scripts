class Example
  
  def one
    puts "one #{self}"
    def two
      puts "two #{self}"
    end
  end
  
end

e = Example.new
e.one
e.two

f = Example.new
f.two