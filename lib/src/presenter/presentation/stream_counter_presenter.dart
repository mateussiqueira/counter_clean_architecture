import 'dart:async';

import 'package:study_tree/src/infra/usecases/usecases.dart';
import 'package:study_tree/src/ui/counter/counter.dart';

class CounterState {
  int value = 0;
}

class StreamCounterPresenter implements CounterPresenter {
  final Counter counter;

  final _controller = StreamController<CounterState>.broadcast();
  final _state = CounterState();

  StreamCounterPresenter({required this.counter});

  @override
  Stream<int> get value =>
      _controller.stream.map((state) => state.value).distinct();

  void update() => _controller.add(_state);

  @override
  void decrement() {
    counter.decrement();
    _state.value = counter.value;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void increment() {
    counter.increment();
    _state.value = counter.value;
    update();
  }
}
