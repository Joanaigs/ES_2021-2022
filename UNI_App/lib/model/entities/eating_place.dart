import 'dart:collection';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:collection/collection.dart';
import 'meal.dart';
import 'meal_.dart';

class EatingPlace{
  final int id;
  final String name;
  final String photoName;
  final bool acceptsCard;
  List<WeekTime> workingHours;
  List<WeekTime> busyTime;
  MapCoordinates location;
  Map<DayOfWeek, List<Meal_>> meals;
  //final String reference; // Used only in html parser



  EatingPlace(
      this.id,
      this.name,
      this.photoName,
      this.workingHours,
      this.acceptsCard,
      this.location);



  /*EatingPlace(this.id, this.name, this.reference, {List<Meal_> meals = null})
      : this.meals = meals != null
      ? groupBy(meals, (meal) => meal.dayOfWeek)
      : HashMap.identity(){}
   */
  /*static EatingPlace fromMap(Map<String, dynamic> map){
    return EatingPlace(map['id'], map['name'], map['ref'], meals:map['meals']);
  }
  */

  List<Meal_> getMealsOfDay(DayOfWeek dayOfWeek){
    return meals[dayOfWeek];
  }

  /*Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name': name,
      'ref': reference
    };
  }
   */
}

class MapCoordinates {
  double latitude;
  double longitude;
}

class WeekTime {
  DayOfWeek day;
  String startTime;
  String endTime;
}