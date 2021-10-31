import 'package:flutter/material.dart';
import 'counter.dart';

import '../../../src/ui/mixins/mixins.dart';

class CounterPage extends StatefulWidget {
  final CounterPresenter presenter;

  CounterPage({required this.presenter, Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> with UIErrorMixin {
  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.presenter.decrement();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: widget.presenter.value,
      stream: widget.presenter.value,
      builder: (context, snapshot) {
        handleValueError(
            context: context, error: widget.presenter.valueErrorStream);
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
                  onPressed: widget.presenter.increment,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: widget.presenter.decrement,
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
