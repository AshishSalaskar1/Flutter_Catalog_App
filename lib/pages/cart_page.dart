import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: "CART".text.make(),
    );
  }
}