import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CardContaReais extends StatelessWidget {
  const CardContaReais({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Rs. 2000',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Image.asset('assets/images/expand.png', width: 80, height: 80)
              ],
            ),
          ),
        ));
  }
}
