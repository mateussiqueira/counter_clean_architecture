abstract class CounterPresenter {
  Stream<int> get value;

  void increment();
  void decrement();

  void dispose();
}
