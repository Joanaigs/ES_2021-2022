import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/entities/meal_.dart';

import 'package:uni/model/utils/day_of_week.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

// import 'dart:_http';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'dart:convert';

Future<String> loadAsset(String file) async {
  return await rootBundle.loadString('assets/text/' + file);
}

Future<Map<DayOfWeek, List<Meal_>>> getMealsAE(String file) async {
  Map<DayOfWeek, List<Meal_>> meals = {};
  DayOfWeek.values.forEach((i) {
    meals[i] = [];
  });
  String text = await loadAsset(file);
  var lines = text.split('\n');
  for (var line in lines) {
    var words = line.split(';');
    for (var day in DayOfWeek.values) {
      meals[day].add(Meal_(
          parseFoodType(words[2]), words[0], true, double.parse(words[1])));
    }
  }
  return meals;
}

Future<Map<DayOfWeek, List<Meal_>>> getMealsWeb(String name, double price) async {
  Map<DayOfWeek, List<Meal_>> meals = {};
  DayOfWeek.values.forEach((i) {
    meals[i] = [];
  });
  meals = await makeRequest(name, price);
  return meals;
}

Future<Map<DayOfWeek, List<Meal_>>> makeRequest(String name, double price) async {
  Map<DayOfWeek, List<Meal_>> meals = {};
  DayOfWeek.values.forEach((i) {
    meals[i] = [];
  });
  final path = 'https://uni4all.servehttp.com/meals/' + name;
  try {
    // Make the GET request
    final response = await http.Client().get(Uri.parse(path));
    final jsonString = jsonDecode(response.body);

    // final jsonString = await HttpRequest.getString(path);
    // The request succeeded. Process the JSON.
    meals = processResponse(jsonString, price);
  } catch (e) {
    // The GET request failed. Handle the error.
    //print("Couldn't open $path");
  }
  return meals;
}

Map<DayOfWeek, List<Meal_>> processResponse(dynamic jsonString, double price) {
  Map<DayOfWeek, List<Meal_>> meals = {};
  DayOfWeek.values.forEach((i) {
    meals[i] = [];
  });
  bool isLunch;
  for (final adapter in jsonString as List<dynamic>) {
    if(adapter['description'].contains('Jantar')){
      isLunch = false;
    }
    else{
      isLunch = true;
    }
    for (var menu in adapter['menus']) {

      final dateTime= DateTime(int.parse(menu['date'].substring(6, 10)), int.parse(menu['date'].substring(3, 5)), int.parse(menu['date'].substring(0, 2)));

      final DayOfWeek day = parseDayOfWeek(DateFormat('EEEE').format(dateTime));
      int i = 0;
      for (var meal in menu['meals']) {
        if(meal['type'] == 'Sopa'){
          continue;
        }

        meals[day].add(Meal_(
            parseFoodType(meal['type']), meal['description'], isLunch, price));
        i++;
      }
    }
  }
  return meals;
}