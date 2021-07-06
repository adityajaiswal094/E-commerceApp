import 'package:flutter/material.dart';
import 'package:some_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String catalogImage;

  const CatalogImage({Key key, @required this.catalogImage})
      : assert(catalogImage != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalogImage)
        .box
        .rounded
        .p1
        .color(MyThemes.cream)
        .make()
        .p12()
        .w40(context);
  }
}
