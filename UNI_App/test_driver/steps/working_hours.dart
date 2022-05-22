import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class AtMainPageWH extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r"I'm the on the {string} mainpage");
}

class TapRestaurantWH extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final restaurant = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, restaurant);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} image");
}

class AtRestaurantWH extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r"I am on the {string} screen");
}

class WorkingHours extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final window = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, window);
  }

  @override
  RegExp get pattern => RegExp(r'The {string} is present');
}