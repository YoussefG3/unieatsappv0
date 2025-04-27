// lib/providers/cart_provider.dart
import 'package:flutter/foundation.dart';
import 'lib/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => [..._items];

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.calculateItemTotal());
  }

  void addItem({
    required String id,
    required String name,
    required double price,
    required String image,
    required String cafeteriaName,
    required String buildingName,
    List<Customization>? customizations,
  }) {
    // Check if the item already exists
    final existingItemIndex = _items.indexWhere((item) => item.id == id);

    if (existingItemIndex >= 0) {
      // Update quantity if item exists
      _items[existingItemIndex] = CartItem(
        id: id,
        name: name,
        price: price,
        image: image,
        cafeteriaName: cafeteriaName,
        buildingName: buildingName,
        quantity: _items[existingItemIndex].quantity + 1,
        customizations: customizations ?? _items[existingItemIndex].customizations,
      );
    } else {
      // Add new item
      _items.add(
        CartItem(
          id: id,
          name: name,
          price: price,
          image: image,
          cafeteriaName: cafeteriaName,
          buildingName: buildingName,
          quantity: 1,
          customizations: customizations,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    if (quantity < 1) return;

    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _items[index] = CartItem(
        id: _items[index].id,
        name: _items[index].name,
        price: _items[index].price,
        image: _items[index].image,
        cafeteriaName: _items[index].cafeteriaName,
        buildingName: _items[index].buildingName,
        quantity: quantity,
        customizations: _items[index].customizations,
      );
      notifyListeners();
    }
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}