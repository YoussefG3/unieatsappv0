import 'package:flutter/material.dart';
import 'package:unieatsappv0/models/cafeteria.dart';
import 'package:unieatsappv0/models/menu_item.dart';
import 'package:unieatsappv0/widgets/cafeteria_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data - in a real app, this would come from a database or API
    final List<Cafeteria> cafeterias = [
      Cafeteria(
        id: 'cafe1',
        name: 'Beanos',
        image: 'assets/images/beanos.png',
        location: 'Main Campus',
        description: 'Coffee shop with fresh pastries and sandwiches.',
        openingHours: '7:00 AM - 7:00 PM',
        isOpen: true,
        // Remove categories parameter if not defined in Cafeteria model
        // Remove rating parameter if not defined in Cafeteria model
      ),
      Cafeteria(
        id: 'cafe2',
        name: 'Cinnamon Factory',
        image: 'assets/images/cinnamon-factory.png',
        location: 'B04 Building',
        description: 'Bakery specializing in cinnamon rolls and pastries.',
        openingHours: '8:00 AM - 6:00 PM',
        isOpen: true,
        // Remove categories parameter if not defined in Cafeteria model
        // Remove rating parameter if not defined in Cafeteria model
      ),
      Cafeteria(
        id: 'cafe3',
        name: 'Nova',
        image: 'assets/images/nova.png',
        location: 'Science Building',
        description: 'Modern cafeteria with a variety of healthy options.',
        openingHours: '8:00 AM - 8:00 PM',
        isOpen: false,
        // Remove categories parameter if not defined in Cafeteria model
        // Remove rating parameter if not defined in Cafeteria model
      ),
    ];

    final List<MenuItem> popularItems = [
      MenuItem(
        id: 'item1',
        name: 'Avocado Toast',
        description: 'Fresh avocado on sourdough bread',
        price: 8.99,
        image: 'assets/images/avocado-toast.png',
        cafeteriaId: 'cafe1',
        rating: 4.5,
        // Remove categories parameter if not defined in MenuItem model
        // Remove isAvailable parameter if not defined in MenuItem model
      ),
      MenuItem(
        id: 'item2',
        name: 'Cappuccino',
        description: 'Espresso with steamed milk and foam',
        price: 4.50,
        image: 'assets/images/cappuccino.png',
        cafeteriaId: 'cafe1',
        rating: 4.2,
        // Remove categories parameter if not defined in MenuItem model
        // Remove isAvailable parameter if not defined in MenuItem model
      ),
      MenuItem(
        id: 'item3',
        name: 'Quinoa Salad',
        description: 'Quinoa with mixed vegetables and feta cheese',
        price: 10.99,
        image: 'assets/images/quinoa-salad.png',
        cafeteriaId: 'cafe3',
        rating: 4.7,
        // Remove categories parameter if not defined in MenuItem model
        // Remove isAvailable parameter if not defined in MenuItem model
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('UniEats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // In a real app, this would refresh data from the server
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Welcome message
            const Text(
              'Good morning, John!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'What would you like to eat today?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for food, cafeterias...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onTap: () {
                // Navigate to search screen
                Navigator.of(context).pushNamed('/search');
              },
              readOnly: true,
            ),
            const SizedBox(height: 24),

            // Cafeterias section
            _buildSectionHeader(
              context,
              title: 'Cafeterias',
              onSeeAll: () {
                // Navigate to cafeterias list
              },
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cafeterias.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to cafeteria detail
                        Navigator.of(context).pushNamed(
                          '/cafeteria',
                          arguments: cafeterias[i].id,
                        );
                      },
                      child: CafeteriaCard(
                        cafeteria: cafeterias[i],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Popular items section
            _buildSectionHeader(
              context,
              title: 'Popular Items',
              onSeeAll: () {
                // Navigate to popular items list
              },
            ),
            const SizedBox(height: 12),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularItems.length,
              itemBuilder: (ctx, i) {
                return _buildPopularItemCard(context, popularItems[i]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      BuildContext context, {
        required String title,
        required VoidCallback onSeeAll,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: const Text('See All'),
        ),
      ],
    );
  }

  Widget _buildPopularItemCard(BuildContext context, MenuItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
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
            const SizedBox(width: 12),
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
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.rating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
