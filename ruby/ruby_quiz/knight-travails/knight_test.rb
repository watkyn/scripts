
require 'test/unit'
require 'knight'

class KnightTest < Test::Unit::TestCase

  def setup
    @knight = Knight.new
  end

  def test_that_knight_has_correct_moves_available
    @knight.position = d4
    assert_equal [e6, f5, f3, e2, c2, b3, b5, c6], @knight.available_moves, "should have all the correct available moves"
  end

  def test_available_moves_from_the_corner
    @knight.position = a1
    assert_equal [b3, c2], @knight.available_moves, "should only have the two moves"
  end

  def test_available_moves_from_just_inside_corner
    @knight.position = g7
    assert_equal [h5, f5, e6, e8], @knight.available_moves, "should have the correct moves"
  end

  def test_available_moves_from_center_with_specified_excludes
    @knight.position = e4
    assert_equal [g5, g3, f2, c3, c5, d6], @knight.available_moves(f6, d2), "should have the correct moves"
  end

  def method_missing(method, *args, &block) 
    return method.to_s if method.to_s.length == 2
    super
  end

end
