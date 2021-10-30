abstract class CounterPresenter {
  Stream<int> get value;
  Stream<String?> get valueErrorStream;
  void increment();
  void decrement();

  void dispose();
}
