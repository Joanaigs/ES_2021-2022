Feature: Post
  User should be able to see eat@feup page.

  Scenario: Select Eat@Feup page
    Given I'm the on the "uni" mainpage
    When I tap the "nav" button
    And I tap the "eatAtfeup" option
    Then I am on the "eat@feup" screen

