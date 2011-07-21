

class CustomWorld

  def tony
    puts "hello tony from my own world"
  end
  
end

World do
  CustomWorld.new
end
