import 'package:study_tree/src/domain/usecases/usecases.dart';
import 'package:test/test.dart';

class Counter implements Increment {
  int value = 0;
  @override
  void increment() => value++;
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
}
