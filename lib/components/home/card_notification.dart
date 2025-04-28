import 'package:e_club/components/home/home_notification.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HomeNotification(
                    color: AppColors.redPrimaryColor,
                    imagePath: "assets/images/iconNotification.png",
                    label: "Lorem ipsum dolor sit amet consectetur",
                    onTap: () {},
                  ),
                  SizedBox(width: 12),
                  HomeNotification(
                    color: AppColors.redPrimaryLightColor,
                    imagePath: "assets/images/iconNotification.png",
                    label: "Lorem ipsum dolor sit amet consectetur",
                    onTap: () {},
                  ),
                  SizedBox(width: 24),
                  HomeNotification(
                    color: AppColors.orangeColor,
                    imagePath: "assets/images/iconNotification.png",
                    label: "Lorem ipsum dolor sit amet consectetur",
                    onTap: () {},
                  ),
                  SizedBox(width: 12),
                  HomeNotification(
                    color: AppColors.redPrimaryColor,
                    imagePath: "assets/images/iconNotification.png",
                    label: "Lorem ipsum dolor sit amet consectetur",
                    onTap: () {},
                  ),
                ],
              ),
            )));
  }
}
