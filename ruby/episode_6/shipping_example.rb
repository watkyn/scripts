class ShippingOption
  
  @subclasses = []
  
  def self.inherited(child)
    puts "including ..."
    @subclasses << child
  end
  
  def self.for(weight, international)
    @subclasses.select { |child| child.can_ship?(weight, international) }
  end

end

class MediaMail < ShippingOption
  def self.can_ship?(weight, international)
    !international
  end
end

class PriorityFlatRate < ShippingOption
  def self.can_ship?(weight, international)
    !international && weight < 4*16
  end
end
