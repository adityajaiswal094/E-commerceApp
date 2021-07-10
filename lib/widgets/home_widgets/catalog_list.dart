import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:some_app/models/cart.dart';
import 'package:some_app/models/catalog.dart';
import 'package:some_app/pages/homeDetail_page.dart';
import 'package:some_app/widgets/home_widgets/catalog_image.dart';
import 'package:some_app/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModels.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModels.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Items catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(catalogImage: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.medium.color(MyThemes.darkBlue).bold.make(),
            catalog.desc.text.sm.textStyle(context.captionStyle).make(),
            HeightBox(8),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _AddToCart(catalog: catalog),
              ],
            ),
          ],
        ))
      ],
    )).red500.roundedLg.square(130).make().py12();
  }
}

class _AddToCart extends StatefulWidget {
  final Items catalog;
  const _AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _isAdded = _isAdded.toggle();
          final _catalog = CatalogModels();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        child: _isAdded ? Icon(Icons.done) : "Buy Now".text.make(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyThemes.darkBlue),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ));
  }
}
