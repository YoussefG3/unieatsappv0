/*
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
  final int userId;
  final List<CartItem> items;
  final DateTime orderTime;
  final DateTime pickupTime;
  final OrderStatus status;
  final double total;
  final String paymentMethod;
  final String cafeteriaId;
  final String cafeteriaName;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.orderTime,
    required this.pickupTime,
    required this.status,
    required this.total,
    required this.paymentMethod,
    required this.cafeteriaId,
    required this.cafeteriaName,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List).map((item) => CartItem(
        id: item['id'],
        menuItem: item['menuItem'],
        quantity: item['quantity'],
        customizations: List<String>.from(item['customizations'] ?? []),
      )).toList(),
      orderTime: DateTime.parse(json['orderTime']),
      pickupTime: DateTime.parse(json['pickupTime']),
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${json['status']}',
        orElse: () => OrderStatus.pending,
      ),
      total: (json['total'] ?? 0.0).toDouble(),
      paymentMethod: json['paymentMethod'],
      cafeteriaId: json['cafeteriaId'],
      cafeteriaName: json['cafeteriaName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => {
        'id': item.id,
        'menuItem': item.menuItem,
        'quantity': item.quantity,
        'customizations': item.customizations,
      }).toList(),
      'orderTime': orderTime.toIso8601String(),
      'pickupTime': pickupTime.toIso8601String(),
      'status': status.toString().split('.').last,
      'total': total,
      'paymentMethod': paymentMethod,
      'cafeteriaId': cafeteriaId,
      'cafeteriaName': cafeteriaName,
    };
  }
}*/
