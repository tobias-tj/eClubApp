import 'package:e_club/components/analytic/interactive_doughnut.dart';
import 'package:e_club/models/category.dart';
import 'package:e_club/utils/format_currency.dart';
import 'package:e_club/utils/get_category_color.dart';
import 'package:flutter/material.dart';
import 'package:e_club/models/expense_item.dart';
import 'package:e_club/services/mock_services.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:go_router/go_router.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<ExpenseMonth> expensesMonth = MockService.getmockExpenses();
  int selectedMonthIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedMonth = expensesMonth[selectedMonthIndex];

    final List<Category> categories = selectedMonth.categories.map((category) {
      return Category(
        name: category.name,
        total: category.total.toDouble(),
        icon: category.icon,
        color: getCategoryColor(category.name),
      );
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: const Text(
          'Gastos',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey, size: 28),
          onPressed: () => context.pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.grey),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: expensesMonth.length,
              itemBuilder: (context, index) {
                final month = expensesMonth[index];
                final isSelected = index == selectedMonthIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMonthIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Container(
                      padding: EdgeInsets.only(bottom: isSelected ? 6 : 0),
                      child: Text(
                        month.month,
                        style: TextStyle(
                            color: isSelected
                                ? AppColors.redPrimaryColor
                                : Colors.black,
                            decoration: isSelected
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationColor: AppColors.redPrimaryColor,
                            decorationThickness: 1,
                            fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: InteractiveDoughnutChart(
              monthActual: selectedMonth.month,
              totalAmount: selectedMonth.total.toDouble(),
              categories: categories,
              onCategorySelected: (category) {
                context.push('/category-detail', extra: {
                  'category': category,
                  'month': selectedMonth.month,
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: selectedMonth.categories.length,
              itemBuilder: (context, index) {
                final category = selectedMonth.categories[index];
                final totalText = formatCurrency(category.total);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          category.icon,
                          color: getCategoryColor(category.name),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        totalText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
