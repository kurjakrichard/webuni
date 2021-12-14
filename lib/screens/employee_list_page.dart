import 'package:flutter/material.dart';
import 'package:webuni/screens/user_items.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Employee List',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromRGBO(176, 179, 191, 1),
      ),
      backgroundColor: const Color.fromRGBO(199, 204, 219, 1),
      body: Column(
        children: const [UserItem(), UserItem(), UserItem()],
      ),
    );
  }
}
