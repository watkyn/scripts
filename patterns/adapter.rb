# Adapter from a Java perspective.  Maybe I will revisit the patterns from a ruby perspective another day

#Class that I received from a team in my company that I need to interface with
class LabResult
  def speed_bar_calculation
    puts 'calculating the speed bar stuff'
  end
  
  def displays_as_high_result
    puts 'HIGH'
  end
  
  def displays_as_low_result
    puts "LOW"
  end
end


#My LabResult that I use all over the place in my own code.
class LabOrder
  def speed_bar_value
    puts "similar calculation as the LabResult"
  end
  
  def abnormal_result?
    puts "looks at both high and low values"
  end
end

#make an interface that wraps the LabResult into the same interface as the LabOrder
class LabResultAdapter
  def initialize(lab_result)
    @labr = lab_result
  end
  
  def speed_bar_value
    @labr.speed_bar_calculation
  end
  
  def abnormal_result?
    @labr.displays_as_low_result or @labr.displays_as_high_result
  end
end


#Now assume we are in java land again and I have a LabOrderInterface that the adapter and the laborder implement, but not the LabResult
lo = LabOrder.new
adapter = LabResultAdapter.new(LabResult.new)

lo.speed_bar_value
adapter.speed_bar_value

lo.abnormal_result?
adapter.abnormal_result?

