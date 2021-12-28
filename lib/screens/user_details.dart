import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:webuni/models/user_data.dart';

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
                Icon(Icons.mail_outline),
                SizedBox(
                  width: 12,
                ),
                Text(user.email, style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            Row(children: [
              Icon(Icons.phone),
              SizedBox(
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
