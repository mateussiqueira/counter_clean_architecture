import 'dart:async';

import 'package:study_tree/src/domain/helpers/helpers.dart';
import 'package:study_tree/src/infra/usecases/usecases.dart';
import 'package:study_tree/src/ui/counter/counter.dart';
import 'package:study_tree/src/ui/mixins/ui_error_mixin.dart';

class CounterState {
  int value = 0;
  String? valueErrorStream;
}

class StreamCounterPresenter with UIErrorMixin implements CounterPresenter {
  final Counter counter;

  final _controller = StreamController<CounterState>.broadcast();
  final _state = CounterState();

  StreamCounterPresenter({required this.counter});

  @override
  Stream<int> get value =>
      _controller.stream.map((state) => state.value).distinct();

  @override
  Stream<String?> get valueErrorStream =>
      _controller.stream.map((state) => state.valueErrorStream).distinct();

  void update() => _controller.add(_state);

  @override
  void decrement() {
    try {
      counter.decrement();
      _state.value = counter.value;
    } on DomainError catch (error) {
      _state.valueErrorStream = error.description;
    }
    update();
  }

  @override
  void increment() {
    counter.increment();
    _state.value = counter.value;
    update();
  }

  @override
  void dispose() {
    _controller.close();
  }
}
