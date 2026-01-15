import 'package:flutter/material.dart';
import '../models/extra_model.dart';


class ExtrasScreen extends StatelessWidget {
  ExtrasScreen({Key? key}) : super(key: key);

  // بيانات افتراضية للطلبات الإضافية
  final List<ExtraModel> extrasData = [
    ExtraModel(
      name: "شوكولا",
      price: 5.0,
      image: "assets/images/chocolate.jpg",
    ),
    ExtraModel(
      name: "بطاقة تهنئة",
      price: 2.0,
      image: "assets/images/card.jpg",
    ),
    ExtraModel(
      name: "هدية صغيرة",
      price: 8.0,
      image: "assets/images/gift.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الطلبات الإضافية"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: extrasData.length,
          itemBuilder: (context, index) {
            final extra = extrasData[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    extra.image,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  extra.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "السعر: \$${extra.price.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.black54),
                ),
                trailing: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.pink,
                ),
                onTap: () {
                  // لاحقاً → إضافة للـ cart أو الانتقال للسلة
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
