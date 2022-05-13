import 'package:uni/controller/load_nenu.dart';
import 'package:uni/model/entities/eating_place.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:uni/view/Pages/EatingPlacesPages/eating_place_page.dart';

import '../../../../testable_widget.dart';

void main() {
  group('MainPage', () {
    Map<DayOfWeek, TimeInterval> workingHours = {};
    DayOfWeek day = parseDayOfWeek('sexta-feira'); //
    workingHours[day] = TimeInterval('9:00', '18:00');
    EatingPlace eatingPlace= EatingPlace(
        1, 'AE', 'ae.jpg', workingHours, false, MapCoordinates(1, 1));
    getMealsAE("ae_ementa.txt").then((value){eatingPlace.meals=value;});
    testWidgets('When opening the Eat@feup', (WidgetTester tester) async {
      final widget = makeTestableWidget(
          child:EatingPlacePage(eatingPlace));
      await tester.pumpWidget(widget);

      expect(find.byType(Container), findsNWidgets(6));
    });
  });
}