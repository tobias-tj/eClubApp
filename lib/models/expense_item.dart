import 'package:flutter/material.dart';

class ExpenseItem {
  final String id;
  final String place;
  final double amount;
  final DateTime dateTime;
  final int codeReference;

  ExpenseItem(
      {String? id,
      required this.place,
      required this.amount,
      required this.dateTime,
      required this.codeReference})
      : id = id ?? UniqueKey().toString();
}

class ExpenseCategory {
  final String id;
  final String name;
  final double total;
  final IconData icon;
  final List<ExpenseItem> expenses;

  ExpenseCategory({
    String? id,
    required this.name,
    required this.total,
    required this.icon,
    required this.expenses,
  }) : id = id ?? UniqueKey().toString();
}

class ExpenseMonth {
  final String id;
  final String month;
  final double total;
  final List<ExpenseCategory> categories;

  ExpenseMonth({
    String? id,
    required this.month,
    required this.total,
    required this.categories,
  }) : id = id ?? UniqueKey().toString();
}
