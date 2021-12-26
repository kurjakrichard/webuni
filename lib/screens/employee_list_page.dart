import 'package:flutter/material.dart';
import 'package:webuni/screens/user_items.dart';
import 'package:webuni/utils/user_repository.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee List',
        ),
      ),
      body: SingleChildScrollView(
        child: Builder(builder: (context) {
          var repository = UserRepository.of(context);
          return Column(
            children: [
              for (var user in repository.users)
                UserItem(
                    image: user.avatarProvider,
                    name: user.name,
                    email: user.email),
            ],
          );
        }),
      ),
    );
  }
}
