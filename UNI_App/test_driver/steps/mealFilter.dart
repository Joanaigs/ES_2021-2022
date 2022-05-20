import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class AtRestaurantPage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r"I am on the {string} screen");
}

class TapFilter extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class TapOption extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r"I tap a {string} button");
}

class FoodFiltered extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern => RegExp(r"The food of that filter appears");
}