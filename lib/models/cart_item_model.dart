class CartItem {
  final String id;
  final String type; // 'flower', 'bouquet', 'extra'
  final String name;
  final String image;
  final double price;
  final int quantity;
  final String? color; // for flowers
  final String? occasion; // for bouquets

  CartItem({
    required this.id,
    required this.type,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.color,
    this.occasion,
  });

  double get totalPrice => price * quantity;

  CartItem copyWith({
    String? id,
    String? type,
    String? name,
    String? image,
    double? price,
    int? quantity,
    String? color,
    String? occasion,
  }) {
    return CartItem(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      occasion: occasion ?? this.occasion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'color': color,
      'occasion': occasion,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      color: json['color'],
      occasion: json['occasion'],
    );
  }
}
