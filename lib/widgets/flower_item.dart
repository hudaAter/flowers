import 'package:flutter/material.dart';
import '../models/flower_model.dart';
import '../theme/app_colors.dart';

class FlowerItem extends StatelessWidget {
  final FlowerModel flower;
  final VoidCallback onTap;

  const FlowerItem({
    Key? key,
    required this.flower,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              AppColors.primaryPink.withOpacity(0.85),
              AppColors.secondaryPurple.withOpacity(0.85),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// صورة الوردة
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                flower.image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            /// اسم الوردة
            Text(
              flower.name,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            /// السعر
            Text(
              "\$${flower.price}",
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
