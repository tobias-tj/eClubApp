import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonExtract extends StatelessWidget {
  const ButtonExtract({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 0.8,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.redPrimaryColor,
            foregroundColor: AppColors.textColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
          onPressed: () => {},
          child: Text(
            'Ver extracto',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
