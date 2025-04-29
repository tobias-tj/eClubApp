import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

Color getCategoryColor(String categoryName) {
  switch (categoryName) {
    case 'Restaurantes y bares':
      return AppColors.restaurantColor;
    case 'Compras':
      return AppColors.shoppingColor;
    case 'Transporte':
      return AppColors.transportColor;
    default:
      return Colors.grey;
  }
}
