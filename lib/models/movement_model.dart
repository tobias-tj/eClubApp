import 'package:flutter/material.dart';

class MovementModel {
  final String title;
  final String category;
  final String monto;
  final String date;
  final int type;
  final IconData icon;

  MovementModel({
    required this.title,
    required this.category,
    required this.monto,
    required this.date,
    required this.type,
    required this.icon,
  });
}
