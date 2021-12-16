import 'dart:io';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;

  const UserItem(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Color.fromRGBO(223, 220, 221, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        height: 70,
        child: Row(
          children: [
            Image.network(imageUrl),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: ListTile(
        leading:
            Image.file(File('C:/Users/balza/OneDrive/Képek/Társkereső/a.jpg')),
        title: Text('Kurják Richárd'),
        subtitle: Text('kurjak.richard@gmail.com'),
        tileColor: Color.fromRGBO(247, 236, 225, 0.5),
      ),
    );
  }**/
}
