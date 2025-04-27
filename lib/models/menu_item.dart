// lib/models/menu_item.dart
class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String cafeteriaId;
  final double rating;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.cafeteriaId,
    required this.rating,
  });
}