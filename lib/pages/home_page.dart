import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_app/core/store.dart';
import 'dart:convert';
import 'package:some_app/models/catalog.dart';
import 'package:some_app/utils/routes.dart';
import 'package:some_app/widgets/home_widgets/catalog_header.dart';
import 'package:some_app/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:some_app/models/cart.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/60eb576fa63d2870c19228a6";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModels.items = List.from(productData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, Routes.cartRoute),
            backgroundColor: Theme.of(context).buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
            size: 21,
            count: _cart.items.length,
            textStyle: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModels.items != null &&
                    CatalogModels.items.isNotEmpty)
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
