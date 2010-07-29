class Struct
  @children = []
  
  class << self
    attr_reader :children  
    def inherited(child)
      @children << child
    end
  end
  
end

Dave = Struct.new(:dave)
Fred = Struct.new(:fred)

puts Struct.children