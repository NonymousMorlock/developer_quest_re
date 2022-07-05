// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:developer_quest/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:developer_quest/flat_button.dart';

void main() {
  testWidgets(
    'Start the game',
    (WidgetTester tester) async {
      final startFinder = find.text('START');

      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Find the start text
      expect(startFinder, findsOneWidget);

      // Start the game.
      expect(find.byType(FlatButton), findsNWidgets(2));
      await tester.tap(startFinder);
      await tester.pumpAndSettle();

      expect(find.text('Tasks'), findsOneWidget);
    },
    // This currently fails with a hanging Future. Not because of code
    // in this app. Skipping until this is resolved. TODO.
    skip: true,
  );
}
