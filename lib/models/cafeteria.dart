class Cafeteria {
  final String id;
  final String name;
  final String image;
  final String location;
  final String description;
  final String openingHours;
  final bool isOpen;
  final double rating;
  final List<String> categories;

  Cafeteria({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.description,
    this.openingHours = '8:00 AM - 8:00 PM',
    this.isOpen = true,
    this.rating = 0.0,
    this.categories = const [],
  });
}
