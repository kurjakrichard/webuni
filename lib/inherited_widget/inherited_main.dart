import 'package:flutter/material.dart';

import 'counterdata.dart';

class CounterProviderWidget extends StatefulWidget {
  final Widget child;

  const CounterProviderWidget({Key? key, required this.child})
      : super(key: key);

  @override
  State<CounterProviderWidget> createState() => _CounterProviderWidgetState();
}

class _CounterProviderWidgetState extends State<CounterProviderWidget> {
  late CounterData _counterData;
  @override
  void initState() {
    _counterData = CounterData(0, _incrementCounter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CounterDataInheritedWidget(data: _counterData, child: widget.child);
  }

  void _incrementCounter() => setState(() {
        _counterData = CounterData(_counterData.count + 1, _incrementCounter);
      });
}
