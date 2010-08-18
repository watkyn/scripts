class Tony

  attr_accessor :name

  alias :old_name :name

  def name
    "not so coool"
  end


end


t = Tony.new
t.name = 'cool guy'
puts t.name
puts t.old_name
