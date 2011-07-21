class Struct
  @children = []
  def self.inherited(child)
    @children << child
  end
end

Tony = Struct.new(:name, :address)
Cow = Struct.new(:name, :speices)

puts Struct.instance_variable_get(:@children)
