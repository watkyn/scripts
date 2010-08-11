# Knight's Travails (#27)
# by Jason Bailey
# Given a standard 8 x 8 chessboard where each position is indicated in algebraic notation (with the lower left corner being a1), design a script that accepts two or more arguments.
# The first argument indicates the starting position of the knight. The second argument indicates the ending position of the knight. Any additional arguments indicate positions that are forbidden to the knight.
# Return an array indicating the shortest path that the knight must travel to get to the end position without landing on one of the forbidden squares. If there is no valid path to the destination return nil.
# 
# example 1:
# a8, b7, b6
# 
# could return
# [ c7 , b5 , d6 , b7 ]
# 
# Example 2:
# a8 , g6 , b6 , c7
# 
# would return
# nil
# 
# Note: That in the majority of cases it would be possible to have more then one valid path.

require 'test/unit'
require 'knight_tour'

class KnightTest < Test::Unit::TestCase

  def test_only_a_h_and_1_8_combos_are_accepted
    assert_raise { tour(a0, a0) }
    #assert_raise { tour(a9, a9) }
    #assert_raise { tour("`1", "`2") }
    #assert_raise { tour(i1, i3) }
    #assert_raise { tour(j1, j1) }
    #assert_raise { tour(k1, k1) }
    # TODO make sure we fuzz more bad data possibilities but do so smarter than this
  end

  def test_simple_one_moves
    assert_equal [c3], tour(b1, c3)
    assert_equal [a3], tour(b1, a3)
    assert_equal [d3], tour(b1, d2)
  end
  
  # def test_a_bunch_of_normal_two_param_calls
  #   assert_equal [c7, b5, d6, b7], tour(a8, b7)
  # end
  
  def method_missing(meth, *args, &blk)
    return meth.to_s if meth.to_s.length == 2
    super    
  end
  
end
