class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final bool isCraftsman;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.isCraftsman
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      isCraftsman: json['is_craftsman'] ?? false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'is_craftsman': isCraftsman
    };
  }
}