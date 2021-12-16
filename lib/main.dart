//A material design kell a fejlesztéshez.
import 'package:flutter/material.dart';
import 'package:webuni/screens/employee_list_page.dart';
//import 'package:webuni/stateful_widgetTest/stateful_test.dart';
//import 'inherited_widget/inherited_main.dart';

// Célszerű külön osztályban csinálni a widgeteket, még a főablakét is.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Employee app',
      home: EmployeeListPage(),
    );
  }
}
