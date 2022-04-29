import 'dart:collection';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:collection/collection.dart';
import 'meal.dart';

class EatingPlace{
  final int id;
  final String name;
  final Map<DayOfWeek, List<Meal>> meals;
  final String reference; // Used only in html parser
  // List<BusyTime> busyTimes;



  EatingPlace(this.id, this.name, this.reference, {List<Meal> meals = null})
      : this.meals = meals != null
      ? groupBy(meals, (meal) => meal.dayOfWeek)
      : HashMap.identity(){}

  static EatingPlace fromMap(Map<String, dynamic> map){
    return EatingPlace(map['id'], map['name'], map['ref'], meals:map['meals']);
  }

  List<Meal> getMealsOfDay(DayOfWeek dayOfWeek){
    return meals[dayOfWeek];
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name': name,
      'ref': reference
    };
  }
}