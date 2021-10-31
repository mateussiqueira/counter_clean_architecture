import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_tree/src/infra/usecases/usecases.dart';
import 'package:study_tree/src/presenter/presentation/stream_counter_presenter.dart';

import 'src/ui/counter/counter.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Counter(0)),
        Bind.factory((i) => StreamCounterPresenter(counter: i<Counter>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => CounterPage(
                  presenter: Modular.get<StreamCounterPresenter>(),
                )),
      ];
}
