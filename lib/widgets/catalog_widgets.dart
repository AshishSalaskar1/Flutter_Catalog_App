
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/catalog_details.dart';
import 'package:flutter_catalog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.make(),
        "Treding Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CatalogDetails(
                    item: CatalogModel.items[index]
                  )
                )
              );
            },
            child: CatalogItem(
                catalog: CatalogModel.items[index]
            ),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            // Hero adds animation (match tag in src->dest widget)
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(imageURL: catalog.image)
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.make(),
                catalog.desc.text.sm.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    "\$${catalog.price}"
                        .text
                        .bold
                        .lg
                        .color(MyThemes.darlBlueish)
                        .make(),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(
                                    MyThemes.darlBlueish),
                            shape: MaterialStateProperty.all(StadiumBorder())
                        ),
                        onPressed: () {},
                        child: "Add to Cart".text.sm.make())
                    ],
                  )
                ],
          ))
        ],
      )
    ).white.py4.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String imageURL;

  const CatalogImage({Key? key, required this.imageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageURL)
        .box
        .rounded
        .p4
        .color(MyThemes.cream)
        .make()
        .p8()
        .w40(context);
    // widget_to_wrap.child_padding.make().widget_padding.widget_width(%) (widget:SizedBox,child:Image)
  }
}