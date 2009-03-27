#going to use ruby to explain facade 
# I am going through design patterns in java so this will help me understand it better going to ruby

#basics - make the complex stuff simple and expose the simple API instead of the complex one

class ComplexThingsFromTheArchitectsInTheIvoryTower

  attr_reader :allocated_listeners
  attr_reader :unique_id
  
  def initialize
    @allocated_listeners = []
  end
  
  #may need this in the future, when we go to a different architecture
  def register_with_system(name)
    @unique_id = name.object_id
  end
  
  def allocate_space_for_listener(listener)
    @allocate_space_for_listener << listener
  end

  def notify_allocated_listeners_of_event(event_notification_event)
    if @unique_id == nil
      raise Exception.new("You need to register with the system before any allocations will be sent")
    end
    
    @allocated_listeners.each do |ene|
      ene.receive(event_notification_event)
    end
  end
  
end

# Facade to simplify the ComplexThingsFromTheArchitectsInTheIvoryTower
class Broadcaster
  
  def initialize()
    @complex = ComplexThingsFromTheArchitectsInTheIvoryTower.new
    @complex.register_with_system("broadcaster")
  end
  
  def send_message(message)
    @complex.notify_allocated_listeners_of_event(message)
  end
  
  def add_receiver(receiver)
    @complex.allocated_listeners << receiver
  end
  
end

class BroadcastReceiver
  def receive(message)
    puts message
  end
end

broadcaster = Broadcaster.new
broadcaster.add_receiver(BroadcastReceiver.new)
broadcaster.send_message("much easier to understand Broadcaster than ComplexThingsFromTheArchitectsInTheIvoryTower (hopefully).  Thanks Facade!")

