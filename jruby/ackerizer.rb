#---
# Excerpted from "Using JRuby",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jruby for more book information.
#---
class Ackermann
  def self.ack(m, n)
    return n + 1                     if m == 0
    return ack(m - 1, 1)             if n == 0
    return ack(m - 1, ack(m, n - 1))
  end
end

require 'rubygems'
require 'java'
require 'rubeus'

include Rubeus::Swing

JFrame.new('Ackerizer') do |frame|
  frame.layout = java.awt.FlowLayout.new

  @m = JTextField.new '3'
  @n = JTextField.new '9'

  JButton.new('->') do
    @result.text = Ackermann.ack(@m.text.to_i,
                                 @n.text.to_i).to_s
  end

  @result = JTextField.new 10

  frame.pack
  frame.show
end

