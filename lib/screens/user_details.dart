import 'package:flutter/material.dart';
import 'package:webuni/models/user_data.dart';
import 'package:webuni/utils/user_repository.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routeSettings = ModalRoute.of(context)!.settings;
    var user = routeSettings.arguments as UserData;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Are you sure?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                UserRepository.of(context)
                                    .onDeleteUser(user.id);
                                Navigator.pop(context);
                              },
                              child: const Text('Delete'),
                            )
                          ],
                        ));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image(image: user.avatarProvider),
            ),
            Row(
              children: [
                const Icon(Icons.mail_outline),
                const SizedBox(
                  width: 12,
                ),
                Text(user.email, style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            Row(children: [
              const Icon(Icons.phone),
              const SizedBox(
                width: 12,
              ),
              Text(user.phone, style: Theme.of(context).textTheme.bodyText1),
            ]),
          ],
        ),
      ),
    );
  }
}
