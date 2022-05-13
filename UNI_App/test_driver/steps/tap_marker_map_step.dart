import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class AtMap extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final page = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, page);
  }

  @override
  RegExp get pattern => RegExp(r'I am the on the {string} screen');
}

class TapMarker extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final marker = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, marker);
  }

  @override
  RegExp get pattern => RegExp(r'I tap a {string} on the map');
}

class InfoWindow extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final window = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, window);
  }

  @override
  RegExp get pattern => RegExp(r'The {string} is present');
}