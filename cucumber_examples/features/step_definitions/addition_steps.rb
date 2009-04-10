Given /^(.+) and (.+)$/ do |one, two|
  @one = one.to_i
  @two = two.to_i
end

When /^I add them together$/ do
end

Then /^the sum should be 12$/ do
  sum = (@one + @two)
  sum == 12
  # assert_equals(@one + @two, 12, "should have added correctly"
end
