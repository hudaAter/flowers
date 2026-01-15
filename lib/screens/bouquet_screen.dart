import 'package:flutter/material.dart';
import '../data/dummy_bouquets.dart';
import '../widgets/bouquet_item.dart';
import '../models/flower_model.dart';
import '../utils/cart_manager.dart';
import '../models/cart_item_model.dart';

class BouquetScreen extends StatefulWidget {
  const BouquetScreen({super.key});

  @override
  State<BouquetScreen> createState() => _BouquetScreenState();
}

class _BouquetScreenState extends State<BouquetScreen> {
  void _refreshCart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final FlowerModel flower = data['flower'];
    final String color = data['color'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر البوكيه'),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/cart',
                  ).then((_) => _refreshCart());
                },
              ),
              if (CartManager.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      CartManager.itemCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Flower info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      flower.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          flower.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "اللون: $color",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: bouquetsData.length,
                itemBuilder: (context, index) {
                  final bouquet = bouquetsData[index];
                  return BouquetItem(
                    bouquet: bouquet,
                    onTap: () {
                      // Add bouquet to cart
                      final cartItem = CartItem(
                        id: '${flower.name}_${bouquet.name}_$color',
                        type: 'bouquet',
                        name: '${flower.name} - ${bouquet.name}',
                        image: bouquet.image,
                        price: bouquet.price,
                        color: color,
                        occasion: bouquet.name,
                      );
                      CartManager.addItem(cartItem);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('تم إضافة ${bouquet.name} للسلة'),
                        ),
                      );

                      // Navigate to extras
                      Navigator.pushNamed(
                        context,
                        '/extras',
                        arguments: {
                          'flower': flower,
                          'bouquet': bouquet,
                          'color': color,
                        },
                      );
                    },
                  );
                },
              ),
            ),
            if (CartManager.itemCount > 0)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${CartManager.itemCount} منتج - \$${CartManager.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/cart',
                        ).then((_) => _refreshCart());
                      },
                      child: const Text(
                        "عرض السلة",
                        style: TextStyle(color: Colors.white),
                      ),
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
