import 'package:mocktail/mocktail.dart';
import 'package:study_tree/src/infra/usecases/counter.dart';
import 'package:study_tree/src/presenter/presentation/presentation.dart';
import 'package:test/test.dart';

class CounterSpy extends Mock implements Counter {
  When mockIncrementCall() => when(() => increment());
  void mockIncrement() => mockIncrementCall().thenAnswer((_) => _);

  When mockDecrementCall() => when(() => decrement());
  void mockDecrement() => mockDecrementCall().thenAnswer((_) => _);

  When mockValueCall() => when(() => value);
  void mockValue(int newValue) => mockValueCall().thenReturn(newValue);
}

void main() {
  late StreamCounterPresenter sut;
  late CounterSpy counter;

  setUp(() {
    counter = CounterSpy();
    sut = StreamCounterPresenter(counter: counter);
    counter.mockIncrement();
    counter.mockDecrement();
  });
  test('Should call Increment with correct values', () {
    counter.mockValue(1);
    sut.increment();

    verify(() => counter.increment()).called(1);
  });

  test('Should call Increment return correct values', () {
    counter.mockValue(1);
    sut.value.listen(expectAsync1((value) => expect(value, 1)));
    sut.increment();
  });

  test('Should call Decrement with correct values', () {
    counter.mockValue(1);

    sut.decrement();

    verify(() => counter.decrement()).called(1);
  });

  test('Should call Decrement return correct values', () {
    counter.mockValue(1);
    sut.value.listen(expectAsync1((value) => expect(value, 1)));
    sut.decrement();
  });
}
