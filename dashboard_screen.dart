/*
import 'package:flutter/material.dart';
import 'package:unieatsappv0/models/cafeteria.dart';
import 'package:unieatsappv0/models/menu_item.dart';
import 'package:unieatsappv0/theme/app_theme.dart';
import 'bottom_navigation.dart';
import 'cafeteria_card.dart';
import 'menu_item_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final List<Cafeteria> cafeterias = [
      // Update the first Cafeteria object (around line 16)
      Cafeteria(
        id: '1',
        name: 'Beanos',
        image: 'assets/icons/coffee.png',
        location: 'Main Campus',
        description: 'Coffee shop with fresh pastries and sandwiches', // Add this line
        rating: 4.5,
        openingHours: '7:00 AM - 8:00 PM',
        categories: ['Coffee', 'Breakfast', 'Sandwiches'],
        isOpen: true,
      ),

// Update the second Cafeteria object (around line 26)
      Cafeteria(
        id: '2',
        name: 'Cinnamon Factory',
        image: 'assets/icons/bakery.png',
        location: 'B04 Building',
        description: 'Bakery specializing in cinnamon rolls and pastries', // Add this line
        rating: 4.2,
        openingHours: '8:00 AM - 6:00 PM',
        categories: ['Bakery', 'Desserts', 'Coffee'],
        isOpen: true,
      ),

// Update the third Cafeteria object (around line 36)
      Cafeteria(
        id: '3',
        name: 'Nova',
        image: 'assets/icons/restaurant.png',
        location: 'Student Center',
        description: 'Restaurant offering Italian cuisine and healthy options', // Add this line
        rating: 4.7,
        openingHours: '10:00 AM - 9:00 PM',
        categories: ['Pizza', 'Pasta', 'Salads'],
        isOpen: true,
      ),
    ];

    final List<MenuItem> popularItems = [
// Update the first MenuItem object (around line 55)
      MenuItem(
        id: '1',
        name: 'Avocado Toast',
        description: 'Fresh avocado on toasted sourdough bread',
        price: 8.99,
        image: 'assets/icons/toast.png',
        categories: ['Breakfast'], // Change from category to categories
        isAvailable: true,
        rating: 4.8,
        cafeteriaId: '1',
      ),

// Update the second MenuItem object (around line 66)
      MenuItem(
        id: '2',
        name: 'Cappuccino',
        description: 'Espresso with steamed milk and foam',
        price: 4.50,
        image: 'assets/icons/coffee.png',
        categories: ['Coffee'], // Change from category to categories
        isAvailable: true,
        rating: 4.6,
        cafeteriaId: '1',
      ),

// Update the third MenuItem object (around line 77)
      MenuItem(
        id: '3',
        name: 'Cinnamon Roll',
        description: 'Freshly baked cinnamon roll with icing',
        price: 3.99,
        image: 'assets/icons/bakery.png',
        categories: ['Bakery'], // Change from category to categories
        isAvailable: true,
        rating: 4.9,
        cafeteriaId: '2',
      ),
    ];

    final List<String> categories = [
      'All',
      'Coffee',
      'Breakfast',
      'Lunch',
      'Dinner',
      'Snacks',
      'Desserts',
      'Drinks',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UniEats',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for food, cafeterias...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Categories
              _buildSectionHeader(context, 'Categories', () {}),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: Chip(
                        label: Text(categories[index]),
                        backgroundColor: index == 0 
                            ? AppTheme.primaryColor 
                            : Theme.of(context).colorScheme.surface,
                        labelStyle: TextStyle(
                          color: index == 0 
                              ? Colors.white 
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Popular Cafeterias
              _buildSectionHeader(context, 'Popular Cafeterias', () {}),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cafeterias.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CafeteriaCard(cafeteria: cafeterias[index]),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Popular Items
              _buildSectionHeader(context, 'Popular Items', () {}),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: popularItems.length,
                itemBuilder: (context, index) {
                  return MenuItemCard(menuItem: popularItems[index]);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, VoidCallback onSeeAll) {
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
}*/
