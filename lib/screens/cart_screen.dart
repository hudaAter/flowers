import 'package:flutter/material.dart';
import '../utils/cart_manager.dart';
import '../utils/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _refreshCart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("سلة الطلب"),
        backgroundColor: AppColors.primary,
        actions: [
          if (CartManager.itemCount > 0)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: () {
                CartManager.clearCart();
                setState(() {});
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('تم مسح السلة')));
              },
            ),
        ],
      ),
      body: CartManager.items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "السلة فارغة",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "أضف بعض المنتجات للبدء",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: CartManager.items.length,
                    itemBuilder: (context, index) {
                      final item = CartManager.items[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item.image,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (item.color != null)
                                      Text(
                                        "اللون: ${item.color}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    if (item.occasion != null)
                                      Text(
                                        "المناسبة: ${item.occasion}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    Text(
                                      "\$${item.price.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          if (item.quantity > 1) {
                                            CartManager.updateQuantity(
                                              item.id,
                                              item.quantity - 1,
                                            );
                                            setState(() {});
                                          }
                                        },
                                      ),
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add, size: 20),
                                        onPressed: () {
                                          CartManager.updateQuantity(
                                            item.id,
                                            item.quantity + 1,
                                          );
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  CartManager.removeItem(item.id);
                                  setState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('تم حذف ${item.name}'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "الإجمالي:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${CartManager.totalAmount.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "الدفع: يدوي عند الاستلام",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/checkout',
                              arguments: {
                                'totalPrice': CartManager.totalAmount,
                              },
                            );
                          },
                          child: const Text(
                            "المتابعة للدفع",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
