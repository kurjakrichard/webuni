import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String email;
  final VoidCallback onTap;

  const UserItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.email,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
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
          clipBehavior: Clip.antiAlias, //Emiatt van a kép lekerekítve
          height: 70,
          child: Row(
            children: [
              Image(image: image),
              const SizedBox(width: 16),
              Expanded(
                //Így a widget mindig kitölti a rendelkezésre álló helyet.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow
                          .ellipsis, //.. jelenít meg, ha túl hosszú a szöveg
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
