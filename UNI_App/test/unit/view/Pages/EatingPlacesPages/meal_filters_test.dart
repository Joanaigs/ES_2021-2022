import 'package:uni/controller/load_menus.dart';
import 'package:uni/model/entities/eating_place.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:uni/view/Pages/EatingPlacesPages/eating_place_page.dart';


void main() {
  group('MealFilters', () {

    test('foodTypeItems should have 6 types', (){
      Map<DayOfWeek, TimeInterval> workingHours = {};
      DayOfWeek day = parseDayOfWeek('sexta-feira'); //
      workingHours[day] = TimeInterval('9:00', '18:00');
      EatingPlace eatingPlace= EatingPlace(
          1, 'AE', 'ae.jpg', workingHours, false, MapCoordinates(1, 1));
      EatingPlacePage eatingPlacePage = EatingPlacePage(eatingPlace);
      EatingPlacePageState eatingPlacesPageState = eatingPlacePage.createState();
      expect(EatingPlacePageState.foodTypeItems.length, 6);
    });

  test('daysOfWeekItems should have 7 days', (){
    Map<DayOfWeek, TimeInterval> workingHours = {};
    DayOfWeek day = parseDayOfWeek('sexta-feira'); //
    workingHours[day] = TimeInterval('9:00', '18:00');
    EatingPlace eatingPlace= EatingPlace(
        1, 'AE', 'ae.jpg', workingHours, false, MapCoordinates(1, 1));
    EatingPlacePage eatingPlacePage = EatingPlacePage(eatingPlace);
    EatingPlacePageState eatingPlacesPageState = eatingPlacePage.createState();
    expect(EatingPlacePageState.dayOfWeekItems.length, 7);
  });

    test('typeOfMealItems should have 2 types', (){
      Map<DayOfWeek, TimeInterval> workingHours = {};
      DayOfWeek day = parseDayOfWeek('sexta-feira'); //
      workingHours[day] = TimeInterval('9:00', '18:00');
      EatingPlace eatingPlace= EatingPlace(
          1, 'AE', 'ae.jpg', workingHours, false, MapCoordinates(1, 1));
      EatingPlacePage eatingPlacePage = EatingPlacePage(eatingPlace);
      EatingPlacePageState eatingPlacesPageState = eatingPlacePage.createState();
      expect(EatingPlacePageState.typeOfMealItems.length, 2);
    });
  });
}