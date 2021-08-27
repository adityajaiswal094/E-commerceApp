import 'package:some_app/core/store.dart';
import 'package:some_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final Items item;

  AddMutation(this.item);

  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Items item;

  RemoveMutation(this.item);

  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
