Feature: Post
  User should be able to see a restaurant page.

  Scenario: Select restaurant
    Given I'm the on the "eat@feup" mainpage
    When I tap the "restaurant" image
    Then I am on the "restaurant" page

