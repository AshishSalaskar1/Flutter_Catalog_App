import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogDetails extends StatelessWidget {
  final Item item;
  const CatalogDetails({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      "\$${item.price}".text.bold.xl3.color(Colors.red.shade900).make(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all(MyThemes.darlBlueish),
                              shape: MaterialStateProperty.all(StadiumBorder())
                          ),
                          onPressed: () {},
                          child: "Add to Cart".text.make())
                      ],
                    ).p0(),
      ),
      backgroundColor: MyThemes.cream,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: Key(item.id.toString()),
                  child: Image.network(item.image)
                ).h40(context).p32(),
                Container(
                  child: VxArc(
                    height: 30.0,
                    edge: VxEdge.TOP,
                    arcType: VxArcType.CONVEY,
                    child: Container(
                      width: context.screenWidth,
                      color: Colors.white,
                      child: Column(
                        children: [
                          item.name.text.xl4.bold.make(),
                          item.desc.text.sm.make(),
                          "Deserunt labore duis anim in eu ad. Excepteur in tempor dolore deserunt incididunt.Mollit laboris proident cupidatat occaecat non ad fugiat."
                            .text.sm.center.make().p16()
                        ],
                      ).py32(),
                    ),
                  )
                )
              ],
            ).py0(),
          ),
        ),
      ),
    );
  }
}
