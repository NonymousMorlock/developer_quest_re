import 'package:developer_quest/src/shared_state/game/world.dart';
import 'package:flutter/material.dart' hide FlatButton;
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:developer_quest/flat_button.dart';

void main() {
  testWidgets('world can be started', (WidgetTester tester) async {
    var buttonKey = const ValueKey('start');

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => World(),
        child: MaterialApp(
          home: Consumer<World>(
            builder: (context, world, child) => FlatButton(
                  key: buttonKey,
                  onPressed: () => world.start(),
                  child: Text(world.isRunning ? 'Stop' : 'Start'),
                ),
          ),
        ),
      ),
    );

    expect(find.text('Stop'), findsNothing);
    await tester.tap(find.byKey(buttonKey));
    await tester.pumpAndSettle();
    expect(find.text('Stop'), findsOneWidget);
  });
}
