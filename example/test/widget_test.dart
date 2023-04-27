// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Api Toggle Demo'), findsOneWidget);

    await tester.pump();

    await tester.tap(find.byIcon(Icons.favorite).last);

    // Tap button
    await tester.pump(const Duration(seconds: 1));

    // Check toggle couter
    expect(find.text('11'), findsOneWidget);
    // Check call API couter
    expect(find.text('1'), findsOneWidget);

    await tester.pump();

    await tester.tap(find.byIcon(Icons.favorite).last);

    // Tap button
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('10'), findsOneWidget);
    // Check call API couter
    expect(find.text('1'), findsOneWidget);
  });
}
