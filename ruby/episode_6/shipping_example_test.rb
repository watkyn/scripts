require "test/unit"
require "shipping_example"

class ShippingExampleTest < Test::Unit::TestCase

  def test_shipping_option_for_works
    options = ShippingOption.for(3*16, false)
    assert_equal 2, options.size
  end

  def test_shipping_options_filter_works
    options = ShippingOption.for(5*16, false)
    assert_equal(1, options.size, "should have filtered out Priorityflatrate")
    assert_equal(MediaMail.class, options[0].class, "should have been MediaMail")
  end
  
end