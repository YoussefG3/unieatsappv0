import 'package:unieatsappv0/models/menu_item.dart';

class Customization {
  final String name;
  final double price;

  Customization({
    required this.name,
    required this.price,
  });
}

class CartItem {
  final String id;
  final String name;
  final double price;
  final String image;
  final String cafeteriaName;
  final String buildingName;
  int quantity;
  final Map<String, dynamic>? customizations;
  final MenuItem menuItem;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.cafeteriaName,
    required this.buildingName,
    required this.quantity,
    this.customizations,
    required this.menuItem,
  });

  double calculateItemTotal() {
    double total = price * quantity;

    // Add customization costs if any
    if (customizations != null && customizations!.isNotEmpty) {
      customizations!.forEach((key, value) {
        if (value is double) {
          total += value * quantity;
        }
      });
    }

    return total;
  }

  // Sample data for testing
  static List<CartItem> getSampleCartItems() {
    return [
      CartItem(
        id: '1',
        name: 'Avocado Toast',
        price: 8.99,
        image: 'assets/images/avocado-toast.png',
        cafeteriaName: 'Beanos',
        buildingName: 'Main Campus',
        quantity: 1,
        customizations: {},
        menuItem: MenuItem(
          id: '1',
          name: 'Avocado Toast',
          description: 'Fresh avocado on sourdough bread',
          price: 8.99,
          image: 'assets/images/avocado-toast.png',
          cafeteriaId: '1',
          rating: 4.5,
        ),
      ),
      CartItem(
        id: '2',
        name: 'Cappuccino',
        price: 4.50,
        image: 'assets/images/cappuccino.png',
        cafeteriaName: 'Beanos',
        buildingName: 'Main Campus',
        quantity: 2,
        customizations: {
          'Extra Shot': 1.50,
          'Oat Milk': 0.75,
        },
        menuItem: MenuItem(
          id: '2',
          name: 'Cappuccino',
          description: 'Espresso with steamed milk and foam',
          price: 4.50,
          image: 'assets/images/cappuccino.png',
          cafeteriaId: '1',
          rating: 4.2,
        ),
      ),
    ];
  }
}
