import 'package:unieatsappv0/models/cart_item.dart';

enum OrderStatus {
  pending,
  preparing,
  ready,
  completed,
  cancelled
}

class Order {
  final String id;
  final String userId;
  final DateTime orderTime;
  final DateTime pickupTime;
  final List<CartItem> items;
  final double subtotal;
  final double tax;
  final double total;
  final OrderStatus status;
  final String cafeteriaId;
  final String cafeteriaName;

  Order({
    required this.id,
    required this.userId,
    required this.orderTime,
    required this.pickupTime,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.total,
    this.status = OrderStatus.pending,
    required this.cafeteriaId,
    required this.cafeteriaName,
  });

  // Fix null safety issues
  CartItem? getCartItem(String itemId) {
    try {
      return items.firstWhere((item) => item.id == itemId);
    } catch (e) {
      return null;
    }
  }

  // Safe access with null checks
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'orderTime': orderTime.toIso8601String(),
      'pickupTime': pickupTime.toIso8601String(),
      'items': items.map((item) => {
        'id': item.id,
        'menuItem': item.menuItem,
        'quantity': item.quantity,
        'customizations': item.customizations,
      }).toList(),
      'subtotal': subtotal,
      'tax': tax,
      'total': total,
      'status': status.toString(),
      'cafeteriaId': cafeteriaId,
      'cafeteriaName': cafeteriaName,
    };
  }
} 