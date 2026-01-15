import 'package:flutter/material.dart';
import '../models/flower_model.dart';
import '../utils/app_colors.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال بيانات الوردة من الصفحة السابقة
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final FlowerModel flower = data["flower"];

    // قائمة الألوان المتاحة للوردة
    final List<String> colors = ["أحمر", "أبيض", "وردي", "أصفر"];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("اختر لون الوردة"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // صورة الوردة
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                flower.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // اسم الوردة
            Text(
              flower.name,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // اختيار اللون
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: colors.map((color) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // الانتقال لصفحة البوكيه مع تمرير الوردة واللون
                    Navigator.pushNamed(
                      context,
                      "/bouquet_screen",
                      arguments: {"flower": flower, "color": color},
                    );
                  },
                  child: Text(
                    color,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
