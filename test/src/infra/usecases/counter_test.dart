import 'package:study_tree/src/domain/helpers/helpers.dart';
import 'package:test/test.dart';

import 'package:study_tree/src/infra/usecases/counter.dart';

void main() {
  late Counter sut;

  setUp(() {
    sut = Counter(0);
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

  test('Counter value should never be decremented if the value < 1', () {
    sut.increment();

    sut.decrement();

    expect(sut.value, 0);

    final result = sut.decrement;
    expect(result, throwsA(DomainError.unexpected));
  });
  test('Counter call decremented throw Exception if the value equals 0', () {
    final result = sut.decrement;

    expect(result, throwsA(DomainError.unexpected));
  });
}
