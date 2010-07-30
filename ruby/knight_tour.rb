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

start_square = ARGV[0]
end_square = ARGV[1]




class KnightTest < Test::Unit::TestCase

  def test_truth
    assert true
  end
  
end
