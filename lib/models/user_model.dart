class User {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String email;
  final String password; // In real app, this should be hashed

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      'email': email,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      password: json['password'],
    );
  }

  User copyWith({
    String? id,
    String? name,
    String? phone,
    String? address,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
