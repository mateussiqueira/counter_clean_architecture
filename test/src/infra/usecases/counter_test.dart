import 'package:test/test.dart';

import 'package:study_tree/src/infra/usecases/counter.dart';

void main() {
  late Counter sut;

  setUp(() {
    sut = Counter();
  });

  test('value should start at 0', () {
    expect(sut.value, 0);
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
