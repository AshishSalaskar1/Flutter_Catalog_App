import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(5),
          title: Text(item.name),
          subtitle: Text(item.desc),
          leading: SizedBox(
            child: Image.network(item.image),
            width: 80,
            height: 120,
          ),
          trailing: Text(
            "\$ ${item.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
        ),
      );
  }
}