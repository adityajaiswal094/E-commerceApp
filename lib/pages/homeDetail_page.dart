import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:some_app/models/catalog.dart';
import 'package:some_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Items catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyThemes.cream,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${catalog.price}",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700]),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 40, width: 80),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyThemes.darkBlue),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                  )),
            )
          ],
        ).px12(),
      ),
      body: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
          ).h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.xl3.color(MyThemes.darkBlue).bold.make(),
                  catalog.desc.text.lg.textStyle(context.captionStyle).make(),
                  HeightBox(8),
                ],
              ).py32(),
            ),
          ))
        ],
      ),
    );
  }
}
