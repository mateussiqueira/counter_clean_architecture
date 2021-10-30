import 'package:study_tree/src/domain/usecases/usecases.dart';
import 'package:test/test.dart';

class Counter implements Increment, Decrement {
  int value = 0;
  @override
  void increment() => value++;

  @override
  void decrement() {
    if (value > 0) {
      value--;
    }
  }
}

void main() {
  late Counter sut;

  setUp(() {
    sut = Counter();
  });

  test('Counter value should be incremented', () {
    sut.increment();

    expect(sut.value, 1);
  });

  test('Counter value should be decremented', () {
    sut.increment();

    sut.decrement();

    expect(sut.value, 0);
  });

  test('Counter value should never be decremented if the value > 1', () {
    sut.decrement();

    expect(sut.value, 0);
  });
}