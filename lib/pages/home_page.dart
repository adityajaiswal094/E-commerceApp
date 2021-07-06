import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:some_app/models/catalog.dart';
import 'package:some_app/widgets/home_widgets/catalog_header.dart';
import 'package:some_app/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Aditya";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModels.items = List.from(productData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: Vx.m20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CatalogList()))
            else
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    ));
  }
}







/*
(CatalogModels.items != null && CatalogModels.items.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final item = CatalogModels.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.deepPurple,
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            )),
                        child: Image.network(item.image),
                        footer: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.black54,
                            child: Text(
                              "\$${item.price.toString()}",
                              style: TextStyle(color: Colors.white),
                            )),
                      ));
                },
                itemCount: CatalogModels.items.length,
              ),
            )
          // else part of conditional operator
          : Center(child: CircularProgressIndicator()),
    );
    */
