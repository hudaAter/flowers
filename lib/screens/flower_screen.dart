import 'package:flutter/material.dart';
//import '../models/flower_model.dart';
import '../data/dummy_flowers.dart';
import '../utils/app_colors.dart';

class FlowerScreen extends StatelessWidget {
  const FlowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("اختر الوردة"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: flowersData.length,
          itemBuilder: (context, index) {
            final flower = flowersData[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  // الانتقال لاختيار اللون
                  Navigator.pushNamed(
                    context,
                    "/color_screen",
                    arguments: {"flower": flower},
                  );
                },
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      flower.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(flower.name),
                  subtitle: Text("السعر: ${flower.price}"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
