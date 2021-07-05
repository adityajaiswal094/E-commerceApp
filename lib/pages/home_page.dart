import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:some_app/models/catalog.dart';
import 'package:some_app/widgets/drawer.dart';
import 'package:some_app/widgets/item_widget.dart';

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
    await Future.delayed(Duration(seconds: 2));
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
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
          ? ListView.builder(
              //if part of conditional operator starts
              itemCount: CatalogModels.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  items: CatalogModels.items[index],
                );
              })
          // else part of conditional operator
          : Center(child: CircularProgressIndicator()),
    );
  }
}
