import 'package:unieatsappv0/models/menu_item.dart';

class CartItem {
  final String id;
  final MenuItem menuItem;
  int quantity;
  final List<String> customizations;

  CartItem({
    required this.id,
    required this.menuItem,
    this.quantity = 1,
    this.customizations = const [],
  });

  double get totalPrice => menuItem.price * quantity;

  CartItem copyWith({
    String? id,
    MenuItem? menuItem,
    int? quantity,
    List<String>? customizations,
  }) {
    return CartItem(
      id: id ?? this.id,
      menuItem: menuItem ?? this.menuItem,
      quantity: quantity ?? this.quantity,
      customizations: customizations ?? this.customizations,
    );
  }
}