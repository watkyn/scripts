Feature: Determine if addition is a consistent operation
  In order to determine if addition is constant and not random
  As a curious mind
  I want to add some numbers repeatedly to get the same answer
  
  Scenario: Adding integers
    Given 4 and 8
    When I add them together
    Then the sum should be 12
    