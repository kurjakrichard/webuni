import 'package:flutter/material.dart';
import 'package:webuni/screens/user_items.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  var userCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Employee List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromRGBO(176, 179, 191, 1),
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: FlutterLogo()),
            ListTile(
                title: const Text('Add user'),
                onTap: () {
                  _incrementCounter();
                  Navigator.pop(context);
                })
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(199, 204, 219, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < userCount; i++)
              UserItem(
                  imageUrl: 'https://randomuser.me/api/portraits/women/$i.jpg',
                  name: 'Kurják Richárd $i',
                  email: 'kurjak.richard@gmail.com'),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() => setState(() {
        userCount++;
      });
}
