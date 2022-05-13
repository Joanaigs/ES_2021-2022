import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class MainPage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r'I am the on the {string} mainpage');
}

class TapMap extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final map = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, map);
  }

  @override
  RegExp get pattern => RegExp(r'I tap the {string} iconButton');
}

class AtMapPage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r"I am on the {string} screen");
}