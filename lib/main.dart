//A material design kell a fejlesztéshez.
import 'package:flutter/material.dart';
import 'package:webuni/inherited_widget/inherited_main.dart';
import 'package:webuni/inherited_widget/counterdata.dart';
import 'package:webuni/screens/stateful_test.dart';

// Célszerű külön osztályban csinálni a widgeteket, még a főablakét is.
void main() => runApp(const InheritedText());

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
