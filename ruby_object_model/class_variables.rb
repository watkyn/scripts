class Class
  
  def do(*syms)
    syms.each do |sym|      
      puts sym
      
      class_eval <<-EOS
        def #{sym}
          puts '#{sym} evaled'
        end
      
      EOS
      
    end
    
  end
end

class Polygon
  
  @@sides = 10
  @stuff = 10
  
  def self.helper(*any)
    puts 'did the helper thing'
  end
  
  def self.sides
    @@sides
  end
  
  def self.stuff
    @stuff
  end
  
end

class Triangle < Polygon
  
  helper :all
  
  @@sides = 20
  @stuff = 4
end

class Bill < Triangle
  @@sides = 30
  @stuff = 5
end

Triangle.do(:tony, :mindy, { :anth => 3, :joey => 4 })

t = Triangle.new

t.tony



