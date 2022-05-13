import 'package:uni/model/entities/exam.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/EatingPlacesPages/main_page.dart';

import '../../../../testable_widget.dart';

void main() {
  group('MainPage', () {
    testWidgets('When opening the Eat@feup', (WidgetTester tester) async {
      final widget = makeTestableWidget(
          child:EatAtFeupMainPage());
      await tester.pumpWidget(widget);

      expect(find.byType(Container), findsNWidgets(6));
    });
  });
}