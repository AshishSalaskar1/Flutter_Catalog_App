// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/catalog_details.dart';
import 'package:flutter_catalog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonStr = await rootBundle
        .loadString("assets/files/catalog.json");
    var catalogData = jsonDecode(jsonStr)["products"];
    CatalogModel.items = List.from(catalogData)
        .map<Item>((x) => Item.fromMap(x))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.cream,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator()
                    .centered()
                    .expand()
            ],
          ),
        ),
      ),
    );
  }
}

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
                  buttonPadding:
                      EdgeInsets.symmetric(horizontal: 10),
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
                            shape: MaterialStateProperty.all(
                                StadiumBorder())),
                        onPressed: () {},
                        child: "Buy".text.make())
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
        .p8
        .color(MyThemes.cream)
        .make()
        .p16()
        .w40(context);
    // widget_to_wrap.child_padding.make().widget_padding.widget_width(%) (widget:SizedBox,child:Image)
  }
}
