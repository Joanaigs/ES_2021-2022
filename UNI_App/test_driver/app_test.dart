import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/tap_marker_map_step.dart';
import 'steps/tap_map_button_step.dart';
import 'steps/main_page.dart';
import 'steps/restaurant_page.dart';
import 'steps/mealFilter.dart';
import 'steps/working_hours.dart';


Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [TapRestaurant(),
      TapRestaurantWH(),
      AtMainPage(),
      AtMainPageWH(),
      AtRestaurant(),
      AtRestaurantWH(),
      MainPage(),
      TapMap(),
      AtMapPage(),
      AtMap(),
      TapMarker(),
      InfoWindow(),
      AtAEPage(), TapNav(), AtNav(),AtEatAtFeupPage(),
    AtRestaurantPage(), TapFilter(), TapOption(), FoodFiltered(), WorkingHours()]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart';
  return GherkinRunner().execute(config);
}