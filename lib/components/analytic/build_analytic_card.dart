import 'package:animate_do/animate_do.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildAnalyticCard(BuildContext context,
    {required String imagePath, required String label}) {
  return FadeInRight(
    duration: const Duration(milliseconds: 1200),
    child: Card(
      color: AppColors.textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: AppColors.redPrimaryColor.withOpacity(0.2),
      elevation: 6,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.4,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 50),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.redPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
