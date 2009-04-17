# the builder pattern is very cool, so I wish I knew what it was all about.
# as always, I will attempt the pattern in ruby using java idioms (so I will know how to do this in java)
# then I will learn the ruby way of doing builder

# java patterns builder

# class ConfigEntry
#   attr_accessor :value
#   
#   def add_attribute(attr)
#     @attrs ||= []
#     @attrs << attr
#   end
#   
# end
# 
# class Configuration
#   
#   def add_entry(config_entry)
#     @entries ||= []
#     @entries << config_entry
#   end
#   
# end
# 
# class ConfigBuilder
#   
# end
# 
# lab_builder = LabResultBuilder.new
# lab_builder.breed = 'labrador'
# lab_builder.species = 'canine'
# lab_builder.result_type = 'xml'
# lab_builder.test = 'heart disease'
# lab_builder.pos_neg_result = 'negative'
# 
# result = lab_builder.build
# 
# puts result

# Example of Test Data Builder

class PurchaseOrder
  attr_reader :number, :vendor, :total, :classification, :department, :company_base
  
  def initialize(number, vendor, total, classification, department, company_base)
    @number = number
    @vendor = vendor
    @total = total
    @classification = classification
    @department = department
    @company_base = company_base
  end

  def to_s
    "#{number} #{vendor} #{total} #{classification} #{department} #{company_base}"
  end
  
end

class PurchaseOrderBuilder
  attr_accessor :number, :vendor, :total, :classification, :department, :company_base  
  
  def build
    PurchaseOrder.new(number || 100, vendor || 'hello', 
                      total || 0.00, classification || "NONE", department || "DEPT", company_base || "BASE")
  end  
end

pb = PurchaseOrderBuilder.new
pb.number = 500
pb.department="GS45"
p = pb.build
puts p


#ruby can do some pretty cool things also
# could make a blank slate object like is done in builder gem but you can look at that code instead.

class TextBuilder
  
  def method_missing(meth, *args, &blk)
    puts meth
    puts args
  end
  
end


tb = TextBuilder.new
tb.hello
tb.say("this is cool")
