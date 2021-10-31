import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_tree/src/infra/usecases/usecases.dart';
import 'package:study_tree/src/presenter/presentation/presentation.dart';
import 'package:study_tree/src/ui/counter/counter.dart';

main() {
  late Counter counter;
  late StreamCounterPresenter presenter;

  Future<void> counterPage(WidgetTester tester) async {
    counter = Counter(0);
    presenter = StreamCounterPresenter(counter: counter);
    final counterPage = MaterialApp(
        home: CounterPage(
      presenter: presenter,
    ));
    await tester.pumpWidget(counterPage);
  }

  tearDown(() {
    presenter.dispose();
  });
  testWidgets('Should Load with correct initial state',
      (WidgetTester tester) async {
    await counterPage(tester);

    final appBarText = find.descendant(
        of: find.bySemanticsLabel('Counter'), matching: find.byType(Text));

    expect(appBarText, findsOneWidget);
  });

  testWidgets('Should increment change value', (WidgetTester tester) async {
    await counterPage(tester);

    presenter.increment();

    final value = find.descendant(
        of: find.bySemanticsLabel('1'), matching: find.byType(Text));

    await tester.pump();

    expect(value, findsOneWidget);
  });

  testWidgets('Should present Error message', (WidgetTester tester) async {
    await counterPage(tester);

    presenter.decrement();

    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
  });

  testWidgets(
    'Should present Error message',
    (WidgetTester tester) async {
      await counterPage(tester);

      presenter.decrement();

      await tester.pump();

      expect(
        find.text('Erro, não é possivel decrementar valores menores que 1'),
        findsOneWidget,
      );
    },
  );

  testWidgets('Should close streams on dispose', (WidgetTester tester) async {
    await counterPage(tester);

    presenter.decrement();
    addTearDown(() {
      presenter.dispose();

      expect(presenter.valueErrorStream, null);
    });
  });
}
