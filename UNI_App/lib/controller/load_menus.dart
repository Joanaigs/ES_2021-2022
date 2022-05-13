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

class Adapter {
  int code;
  String description;
  ScheduleAdapter schedule;
  List<MenusAdapter> menus;

  Adapter({this.code, this.description, this.schedule, this.menus});

  Adapter.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    schedule = json['schedule'] != null
        ? ScheduleAdapter.fromJson(json['schedule'])
        : null;
    if (json['menus'] != null) {
      menus = [];
      json['menus'].forEach((v) {
        menus.add(MenusAdapter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    if (this.schedule != null) {
      data['schedule'] = this.schedule.toJson();
    }
    if (this.menus != null) {
      data['menus'] = this.menus.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleAdapter {
  String start;
  String end;

  ScheduleAdapter({this.start, this.end});

  ScheduleAdapter.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

class MenusAdapter {
  String state;
  String date;
  List<MealsAdapter> meals;

  MenusAdapter({this.state, this.date, this.meals});

  MenusAdapter.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    date = json['date'];
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals.add(MealsAdapter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['state'] = this.state;
    data['date'] = this.date;
    if (this.meals != null) {
      data['meals'] = this.meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MealsAdapter {
  String state;
  String description;
  String type;

  MealsAdapter({this.state, this.description, this.type});

  MealsAdapter.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['state'] = this.state;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}
