import 'package:flutter/foundation.dart';
import 'package:unieatsappv0/models/cart_item.dart';
import 'package:unieatsappv0/models/menu_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items {
    return _items.values.toList();
  }

  int get itemCount {
    return _items.length;
  }

  double get subtotal {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.calculateItemTotal();
    });
    return total;
  }

  double get tax {
    return subtotal * 0.08; // 8% tax
  }

  double get total {
    return subtotal + tax;
  }

  void addItem(CartItem cartItem) {
    if (_items.containsKey(cartItem.id)) {
      // Update existing item
      _items.update(
        cartItem.id,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          menuItem: existingCartItem.menuItem,
          quantity: existingCartItem.quantity + cartItem.quantity,
          customizations: cartItem.customizations,
          name: existingCartItem.name,
          price: existingCartItem.price,
          image: existingCartItem.image,
          cafeteriaName: existingCartItem.cafeteriaName,
          buildingName: existingCartItem.buildingName,
        ),
      );
    } else {
      // Add new item
      _items.putIfAbsent(cartItem.id, () => cartItem);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          menuItem: existingCartItem.menuItem,
          quantity: quantity,
          customizations: existingCartItem.customizations,
          name: existingCartItem.name,
          price: existingCartItem.price,
          image: existingCartItem.image,
          cafeteriaName: existingCartItem.cafeteriaName,
          buildingName: existingCartItem.buildingName,
        ),
      );
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
