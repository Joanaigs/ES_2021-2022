import 'package:uni/model/entities/exam.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/eatAtFeup/eating_place_card.dart';

import '../../../../testable_widget.dart';

void main() {
  group('EatingPageCard', () {
    String photo="ae.jpg";
    String name="AE";
    testWidgets('When given a restaurant', (WidgetTester tester) async {
      final widget = makeTestableWidget(
          child: BuildRestaurantCard(photoName: photo, name: name));
      await tester.pumpWidget(widget);

      expect(find.byType(Container), findsNWidgets(2));
    });
  });
}