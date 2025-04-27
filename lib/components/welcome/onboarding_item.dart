import 'package:animate_do/animate_do.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingItem {
  final IconData icon;
  final String title;
  final String description;

  OnboardingItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  final bool isLastPage;

  const OnboardingPage({
    super.key,
    required this.item,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BounceInDown(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.redPrimaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.icon,
                size: 60,
                color: AppColors.redPrimaryDarkColor,
              ),
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Text(
              item.title,
              style: const TextStyle(
                color: AppColors.redPrimaryDarkColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            child: Text(
              item.description,
              style: const TextStyle(
                color: AppColors.redPrimaryDarkColor,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
