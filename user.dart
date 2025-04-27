class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final bool hasPenalty;
  final double penaltyAmount;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    this.hasPenalty = false,
    this.penaltyAmount = 0.0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'] ?? '',
      hasPenalty: json['hasPenalty'] ?? false,
      penaltyAmount: (json['penaltyAmount'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'hasPenalty': hasPenalty,
      'penaltyAmount': penaltyAmount,
    };
  }
}