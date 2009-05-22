# Composite Design pattern

module Menu
  
  def initialize(display_name)
    @display_name = display_name
  end
  
  def display
    puts @display_name
  end
  
end

class ParentMenu
  include Menu
  
  attr_reader :sub_menus
  
  def initialize(display_name)
    super(display_name)
    @sub_menus = []
  end  
  
  def add_sub_menu(sub_menu)
    @sub_menus << sub_menu
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
root_menu.add_sub_menu(MenuItem.new('New'))
recent = root_menu.add_sub_menu(ParentMenu.new('Recent'))
recent.add_sub_menu(MenuItem.new('    Budget.rb'))
recent.add_sub_menu(MenuItem.new('    Passwords.txt'))
recent.add_sub_menu(MenuItem.new('    GroceryList.txt'))
root_menu.add_sub_menu(MenuItem.new('Exit'))

# display the root menu
root_menu.display



