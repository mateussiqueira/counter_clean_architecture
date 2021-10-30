import 'package:flutter/material.dart';

import '../../../src/infra/usecases/usecases.dart';
import '../../../src/presenter/presentation/presentation.dart';
import '../../../src/ui/mixins/mixins.dart';

class CounterPage extends StatelessWidget with UIErrorMixin {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Counter(0);
    final presenter = StreamCounterPresenter(counter: counter);
    return StreamBuilder(
      initialData: presenter.value,
      stream: presenter.value,
      builder: (context, snapshot) {
        handleValueError(context: context, error: presenter.valueErrorStream);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter'),
          ),
          body: Center(
            child: Text(snapshot.data.toString()),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: presenter.increment,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: presenter.decrement,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
