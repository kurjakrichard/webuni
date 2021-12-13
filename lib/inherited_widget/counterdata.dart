import 'package:flutter/widgets.dart';

class CounterData {
  final int count;
  final VoidCallback incrementCallback;

  CounterData(this.count, this.incrementCallback);
}

class CounterDataInheritedWidget extends InheritedWidget {
  final CounterData data;

  const CounterDataInheritedWidget(
      {required this.data, required Widget child, Key? key})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(CounterDataInheritedWidget oldWidget) =>
      oldWidget.data != data;

  static CounterData of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<CounterDataInheritedWidget>()!
      .data;
}
