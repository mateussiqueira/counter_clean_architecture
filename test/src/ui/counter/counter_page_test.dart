import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_tree/src/ui/counter/counter.dart';

main() {
  testWidgets('Should Load with correct initial state',
      (WidgetTester tester) async {
    const counterPage = MaterialApp(home: CounterPage());

    await tester.pumpWidget(counterPage);

    final appBarText = find.descendant(
        of: find.bySemanticsLabel('Counter'), matching: find.byType(Text));

    expect(appBarText, findsOneWidget);
  });
}
