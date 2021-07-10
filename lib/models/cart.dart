import 'package:some_app/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  CatalogModels _catalog;

  //Collection of IDs - Store Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModels get catalog => _catalog;

  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Items> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item
  void add(Items items) {
    _itemIds.add(items.id);
  }

  //Remove Item
  void remove(Items items) {
    _itemIds.remove(items.id);
  }
}
