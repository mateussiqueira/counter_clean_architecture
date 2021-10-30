import 'package:flutter/widgets.dart';

class MeuEmail extends InheritedWidget {
  const MeuEmail({
    Key? key,
    required this.provedor,
    required Widget child,
  }) : super(key: key, child: child);
  final String provedor;
  static MeuEmail of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MeuEmail>() as MeuEmail;
  }

  @override
  bool updateShouldNotify(MeuEmail old) => provedor != old.provedor;
}
