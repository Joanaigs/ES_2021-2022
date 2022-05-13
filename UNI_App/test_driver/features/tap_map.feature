Feature: Tapped Maps
  User should be able to see the map page.

  Scenario: Current page is redirected to the maps page when the map icon button is pressed (1)
    Given I am the on the "eat@feup" mainpage
    When I tap the "map" iconButton
    Then I am on the "mapPage" screen

