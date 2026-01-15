class BouquetModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final int count; // عدد الورود
  final String occasion; // المناسبة

  BouquetModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
    required this.occasion,
  });
}

