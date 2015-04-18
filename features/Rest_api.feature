Feature: Rest api examples

  Scenario: Simple Card game end end
    Given I create a new card game with "bob" "carol" "ted" "alice"
    When I welcome the players
    And a player deals the cards
    Then I display the cards each player gets

  Scenario: 5th player gets an error message
    Given I create a new card game with "bob" "carol" "ted" "alice"
    When I welcome the players
    And "ralph" joins the game
    Then "ralph" should get an error message


 # NEW FEATURE INTRODUCED TO HAVE 5TH PLAYER

  Scenario: 5th player should be accepted
    Given I create a new card game with "bob" "carol" "ted" "alice"
    When I welcome the players
    And "ralph" joins the game
    Then "ralph" should get welcome message
    And a player deals the cards
    And I display the cards each player gets
