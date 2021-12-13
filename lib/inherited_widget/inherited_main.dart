import 'package:flutter/material.dart';
import 'package:webuni/inherited_widget/inherited_stateful.dart';
import 'package:webuni/inherited_widget/counterdata.dart';

class InheritedText extends StatelessWidget {
  const InheritedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CounterProviderWidget(
      child: MaterialApp(
        title: 'Inherited test',
        home: Scaffold(
          body: Center(
            child: CounterControlWidget(),
          ),
        ),
      ),
    );
  }
}

class CounterControlWidget extends StatelessWidget {
  const CounterControlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = CounterDataInheritedWidget.of(context);
    return Column(
      children: [
        Text('${counter.count}'),
        ElevatedButton(
          child: const Text('Press me'),
          onPressed: () {
            counter.incrementCallback();
          },
        ),
      ],
    );
  }
}
