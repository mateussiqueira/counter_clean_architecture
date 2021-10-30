import '../../domain/usecases/usecases.dart';

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
