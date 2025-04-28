import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HomeNotification extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const HomeNotification({
    super.key,
    required this.color,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
