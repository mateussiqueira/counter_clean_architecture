import 'package:study_tree/src/domain/helpers/domain_error.dart';

import '../../domain/usecases/usecases.dart';

class Counter implements Increment, Decrement {
  late int _value;

  Counter(this._value) {
    _value = 0;
  }

  int get value => _value;
  @override
  void increment() => _value++;

  @override
  void decrement() {
    if (_value > 0) {
      _value--;
    } else {
      throw DomainError.unexpected;
    }
  }
}
