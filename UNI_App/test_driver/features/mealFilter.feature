Feature: Post
  User should be able to see different dishes depending on the filter of food.

  Scenario: Select Filter
    Given I am on the "restaurantPage" screen
    When I tap the "firstFilter" button
    And I tap a "option" button
    Then The food of that filter appears

