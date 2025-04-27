import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unieatsappv0/models/cafeteria.dart';
import 'package:unieatsappv0/models/menu_item.dart';
import 'package:unieatsappv0/providers/cart_provider.dart';
import 'package:unieatsappv0/models/cart_item.dart';

class CafeteriaScreen extends StatelessWidget {
  final String cafeteriaId;
  final Cafeteria? cafeteria;

  const CafeteriaScreen({
    super.key,
    required this.cafeteriaId,
    this.cafeteria,
  });

  @override
  Widget build(BuildContext context) {
    // In a real app, this would come from a database or API
    final displayCafeteria = cafeteria ?? Cafeteria(
      id: cafeteriaId,
      name: 'Beanos',
      image: 'assets/images/beanos.png',
      location: 'Main Campus',
      description: 'Coffee shop with fresh pastries and sandwiches.',
      openingHours: '7:00 AM - 7:00 PM',
      isOpen: true,
    );

    // Sample menu items
    final List<MenuItem> menuItems = [
      MenuItem(
        id: 'item1',
        name: 'Avocado Toast',
        description: 'Fresh avocado on sourdough bread',
        price: 8.99,
        image: 'assets/images/avocado-toast.png',
        cafeteriaId: cafeteriaId,
        rating: 4.5,
      ),
      MenuItem(
        id: 'item2',
        name: 'Cappuccino',
        description: 'Espresso with steamed milk and foam',
        price: 4.50,
        image: 'assets/images/cappuccino.png',
        cafeteriaId: cafeteriaId,
        rating: 4.2,
      ),
      MenuItem(
        id: 'item3',
        name: 'Cinnamon Roll',
        description: 'Freshly baked cinnamon roll with icing',
        price: 3.99,
        image: 'assets/images/cinnamon-roll.png',
        cafeteriaId: cafeteriaId,
        rating: 4.7,
      ),
      MenuItem(
        id: 'item4',
        name: 'Quinoa Salad',
        description: 'Quinoa with mixed vegetables and feta cheese',
        price: 10.99,
        image: 'assets/images/quinoa-salad.png',
        cafeteriaId: cafeteriaId,
        rating: 4.3,
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(displayCafeteria.name),
              background: Image.asset(
                displayCafeteria.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.restaurant, color: Colors.grey[600], size: 80),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status and Hours
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: displayCafeteria.isOpen
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          displayCafeteria.isOpen ? 'Open' : 'Closed',
                          style: TextStyle(
                            color: displayCafeteria.isOpen ? Colors.green : Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        displayCafeteria.openingHours,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    displayCafeteria.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        displayCafeteria.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Menu Title
                  const Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildMenuItem(context, menuItems[index], displayCafeteria),
              childCount: menuItems.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item, Cafeteria cafeteria) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: Icon(Icons.fastfood, color: Colors.grey[600]),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Item details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          // Create a CartItem
                          final cartItem = CartItem(
                            id: item.id,
                            name: item.name,
                            price: item.price,
                            image: item.image,
                            cafeteriaName: cafeteria.name,
                            buildingName: cafeteria.location,
                            quantity: 1,
                            customizations: {},
                            menuItem: item,
                          );

                          // Add to cart
                          cartProvider.addItem(cartItem);

                          // Show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item.name} added to cart'),
                              duration: const Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'VIEW CART',
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/cart');
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
