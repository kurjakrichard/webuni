import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          ElevatedButton(
            child: const Text('Press me'),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
          Text('Counter value: $count'),
        ],
      ),
    );
  }
}
