module Helper

  extend self

  def nonny
    puts "'nonny"
  end

  def help
    puts "help"
  end

  def display
    puts "display"
  end

end


class ExtendTheHelper
  extend Helper
end

class IncludeTheHelper
  include Helper
end

