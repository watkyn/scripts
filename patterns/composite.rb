# Composite Design pattern

module Menu
  
  attr_accessor :display_name, :parent
  
  def initialize(display_name)
    @display_name = display_name
    @parent = nil
  end
  
  def parent
    @parent ? @parent.display_name : "none"
  end
  
  def display
    puts "#{@display_name} (Parent: #{parent})"
  end
end

class ParentMenu
  include Menu
  
  attr_reader :sub_menus
  
  def initialize(display_name)
    super(display_name)
    @sub_menus = []
  end  
  
  def <<(sub_menu)
    @sub_menus << sub_menu
    sub_menu.parent = self
    return sub_menu
  end
  
  def display
    super
    @sub_menus.each do |s|
      s.display
    end
  end
end

class MenuItem
  include Menu
end


# construct a tree of menus
root_menu = ParentMenu.new('File')
root_menu << MenuItem.new('New')
recent = root_menu << ParentMenu.new('Recent')
recent << MenuItem.new('    Budget.rb')
recent<< MenuItem.new('    Passwords.txt')
recent << MenuItem.new('    GroceryList.txt')
root_menu << MenuItem.new('Exit')

# display the root menu
root_menu.display



