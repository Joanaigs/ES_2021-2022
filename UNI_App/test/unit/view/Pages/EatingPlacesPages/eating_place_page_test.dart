import 'package:uni/controller/load_menus.dart';
import 'package:uni/model/entities/eating_place.dart';
import 'package:uni/model/entities/meal_.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/entities/meal.dart';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:uni/view/Pages/EatingPlacesPages/eating_place_page.dart';
import 'package:flutter/cupertino.dart';

import '../../../../testable_widget.dart';


void main() {
  group('MainPage', () {
    Map<DayOfWeek, List<TimeInterval>> workingHours = {};
    Map<DayOfWeek, List<Meal_>> meal = {};
    for(var day in DayOfWeek.values){
      Meal_ temp=Meal_(FoodType.Carne, 'assas', true, 12.0);
      meal[day] = [temp];
    }
    DayOfWeek day = parseDayOfWeek('sexta-feira'); //
    DayOfWeek.values.forEach((i) {
      workingHours[i] = [];
    });
    workingHours[day].add(TimeInterval('9:00', '18:00'));
    EatingPlace eatingPlace= EatingPlace(
        1, 'AE', 'ae.jpg', workingHours, false, MapCoordinates(1, 1));
    eatingPlace.workingHours = EatingPlace.createWorkingHours("09h30", '19h00');
    eatingPlace.meals=meal;
    testWidgets('When opening the Eat@feup', (WidgetTester tester) async {
      final widget = makeTestableWidget(
          child:EatingPlacePage(eatingPlace));
      await tester.pumpWidget(widget);

      expect(find.byType(Container), findsNWidgets(25));
    });
  });
}