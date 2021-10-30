import 'package:study_tree/src/domain/usecases/usecases.dart';
import 'package:test/test.dart';

class Counter implements Increment {
  @override
  int increment(int value) {
    return value + 1;
  }
}

void main() {
  late Counter sut;

  setUp(() {
    sut = Counter();
  });

  test('Should call Increment return input number plus 1', () {
    final result = sut.increment(3);

    expect(result, 4);
  });
}
