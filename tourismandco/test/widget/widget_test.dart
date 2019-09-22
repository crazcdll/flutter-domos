// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tourismandco/app.dart';
import 'package:tourismandco/models/location.dart';

void main() {
  testWidgets('List of locations loads.', (WidgetTester tester) async {
//     final locations = Location.fetchAll();

    await tester.pumpWidget(App());
//    await tester.pump(new Duration(milliseconds: 500));
//    expect(find.text(locations[0].name), findsOneWidget);

    expect(find.byWidget(ListView()), findsOneWidget);
  });
}
