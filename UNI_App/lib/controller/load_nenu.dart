
import 'package:uni/model/entities/meal_.dart';

import 'package:uni/model/utils/day_of_week.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
Future<String> loadAsset(String file) async {
  return await rootBundle.loadString('assets/text/'+file);
}

Future<Map<DayOfWeek, List<Meal_>>> getMealsAE(String file) async{
  Map<DayOfWeek, List<Meal_>> meals = {};
  DayOfWeek.values.forEach((i){
    meals[i] = [];
  });
  String text= await loadAsset(file);
  var lines=text.split('\n');
  for(var line in lines){
    var words=line.split(';');
    for(var day in DayOfWeek.values)
    {
      meals[day].add(Meal_(parseFoodType(words[2]), words[0], true, double.parse(words[1])));
    }
  }
  return meals;
}