import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HomeActionItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const HomeActionItem({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textColor,
            foregroundColor: AppColors.redPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 30,
              height: 30,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
