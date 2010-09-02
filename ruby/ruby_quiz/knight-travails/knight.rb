
class Knight

  attr_accessor :position
  attr_reader :move_history

  def initialize(start_pos='a1')
    @position = start_pos
  end

  def self.all_moves(position, *forbidden)
    Knight.new(position).available_moves(*forbidden)
  end

  def available_moves(*excludes)
    letter, number = split_position(@position) 
    moves = []
    moves << move(1, 2, excludes)
    moves << move(2, 1, excludes)
    moves << move(2, -1, excludes)
    moves << move(1, -2, excludes)
    moves << move(-1, -2, excludes)
    moves << move(-2, -1, excludes)
    moves << move(-2, 1, excludes)
    moves << move(-1, 2, excludes)
    moves.compact
  end

  def move(letter_change, number_change, excludes=[])
    letter, number = split_position(@position)
    proposed_move = "#{num_to_letter(letter + letter_change)}#{number + number_change}"
    valid_move?(proposed_move, excludes) ? proposed_move : nil
  end

  def valid_move?(proposed_position, excludes=[])
    letter, number = split_position(proposed_position)
    (1..8).include?(number) && (0..7).include?(letter) && !excludes.include?(proposed_position)
  end

  def split_position(pos)
    [letter_to_num(pos[0, 1]), number = pos[1, 2].to_i]
  end

  private

  def letter_to_num(letter)
    case letter
    when "a" then 0
    when "b" then 1
    when "c" then 2
    when "d" then 3
    when "e" then 4
    when "f" then 5
    when "g" then 6
    when "h" then 7
    else
      nil
    end
  end


  def num_to_letter(num)
    case num
    when 0 then "a"
    when 1 then "b"
    when 2 then "c"
    when 3 then "d"
    when 4 then "e"
    when 5 then "f"
    when 6 then "g"
    when 7 then "h"
    else
      nil
    end
  end

end

