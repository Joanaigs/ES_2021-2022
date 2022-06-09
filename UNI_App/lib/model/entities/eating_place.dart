import 'package:uni/model/utils/day_of_week.dart';
import 'meal_.dart';

class EatingPlace{
  final int id;
  final String name;
  final String photoName;
  final bool acceptsCard;
  Map<DayOfWeek, List<TimeInterval>> workingHours;
  Map<DayOfWeek, TimeInterval> busyTime;
  MapCoordinates location;
  Map<DayOfWeek, List<Meal_>> meals;

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
      testMeals[day].add(Meal_(FoodType.Carne, 'Porco assado', true, 3.75));
      testMeals[day].add(Meal_(FoodType.Carne, 'Frango assado', false, 2.75));
      testMeals[day].add(Meal_(FoodType.Peixe, 'Robalo assado', true, 3.25));
      testMeals[day].add(Meal_(FoodType.Vegetariano, 'Grão assado', true, 2.75));
      testMeals[day].add(Meal_(FoodType.Dieta, 'Peru assado', true, 2.75));
    }

    return testMeals;
  }


  List<Meal_> getMealsOfDay(DayOfWeek dayOfWeek){
    return meals[dayOfWeek];
  }

  static  Map<DayOfWeek, List<TimeInterval>> createWorkingHours(String start, String end){
    Map<DayOfWeek, List<TimeInterval>> schedule = {};
    DayOfWeek.values.forEach((i) {
      schedule[i] = [];
    });
     DayOfWeek.values.forEach((i) {
       schedule[i].add(TimeInterval(start, end));
     });


    return schedule;
  }

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