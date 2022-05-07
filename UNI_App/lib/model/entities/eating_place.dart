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
  Map<DayOfWeek, TimeInterval> workingHours;
  Map<DayOfWeek, TimeInterval> busyTime;
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



  static Map<DayOfWeek, List<Meal_>> getTestMeals(){
    Map<DayOfWeek, List<Meal_>> testMeals = {};
    DayOfWeek.values.forEach((i){
      testMeals[i] = [];
    });

    for(var day in DayOfWeek.values){
      if(day == DayOfWeek.sunday || day == DayOfWeek.tuesday) continue;
      testMeals[day].add(Meal_(FoodType.Carne, 'Porco assado', true, 2.75));
      testMeals[day].add(Meal_(FoodType.Carne, 'Frango assado', false, 2.75));
      testMeals[day].add(Meal_(FoodType.Peixe, 'Robalo assado', true, 2.75));
      testMeals[day].add(Meal_(FoodType.Vegetariano, 'Grão assado', true, 2.75));
      testMeals[day].add(Meal_(FoodType.Dieta, 'Peru assado', true, 2.75));
    }

    return testMeals;
  }



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

  MapCoordinates(this.latitude, this.longitude);
}

class TimeInterval {
  String startTime;
  String endTime;

  TimeInterval(this.startTime, this.endTime);
}