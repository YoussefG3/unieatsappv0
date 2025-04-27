import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime dateTime;
  final String status;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.dateTime,
    required this.status,
  });
}

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  int get orderCount {
    return _orders.length;
  }

  void addOrder(List<CartItem> cartItems, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        items: cartItems,
        total: total,
        dateTime: DateTime.now(),
        status: 'Processing',
      ),
    );
    notifyListeners();
  }
}