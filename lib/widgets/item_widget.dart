import 'package:flutter/material.dart';
import 'package:some_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Items items;

  const ItemWidget({Key key, @required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
      child: Card(
        shape: StadiumBorder(),
        child: ListTile(
          onTap: () {
            print("${items.name} pressed");
          },
          leading: Image.network(items.image),
          title: Text(items.name),
          subtitle: Text(items.desc),
          trailing: Text(
            "\$${items.price.toString()}",
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
            textScaleFactor: 1.2,
          ),
        ),
      ),
    );
  }
}
