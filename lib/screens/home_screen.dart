import 'package:flutter/material.dart';
import '../data/dummy_flowers.dart';
import '../models/flower_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('متجر الورود'),
        centerTitle: true,
       // backgroundColor: AppColors.primary,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عمودين
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: flowersData.length,
        itemBuilder: (context, index) {
          final FlowerModel flower = flowersData[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/color_selection', // صفحة اختيار اللون
                arguments: {
                  'flower': flower,
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                //color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    flower.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    flower.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                     // color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "\$${flower.price}",
                    style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
