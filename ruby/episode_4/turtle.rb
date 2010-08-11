class Turtle

  def right
    puts "r"
  end

  def left
    puts "l"
  end

  def up
    puts "u"
  end

  def down
    puts 'd'
  end

  def move(&block)
    instance_eval &block
  end

end

t = Turtle.new
t.move do
  right
  up
  down
  left
end

