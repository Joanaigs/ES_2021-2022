Feature: Tap marker on map
    Tapping a marker on the map show the corresponding infoWindow

    Scenario: Tap marker
    Given: I am on the "mapPage" screen
    When: I tap a "marker" on the map
    Then: The "infoWindow" is present