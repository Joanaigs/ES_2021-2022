Feature: Post
  User should be able to see the working hours of a restaurant page.

  Scenario: See working hours
    Given I am the on the "eat@feup" mainpage
    When I tap the "restaurant" image
    Then I am on the "restaurantPage" screen
    And The "workingHours" is present
