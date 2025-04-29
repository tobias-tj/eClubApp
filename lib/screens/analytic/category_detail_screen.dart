import 'package:e_club/components/analytic/doughnut_chart_painter.dart';
import 'package:e_club/models/category.dart';
import 'package:e_club/models/expense_item.dart';
import 'package:e_club/services/mock_services.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Category category;
  final String initialMonth;

  const CategoryDetailScreen({
    Key? key,
    required this.category,
    required this.initialMonth,
  }) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late int selectedMonthIndex;
  late List<ExpenseMonth> expensesMonth;
  late List<ExpenseItem> filteredExpenses = [];
  late double categoryTotal = 0;

  @override
  void initState() {
    super.initState();
    expensesMonth = MockService.getmockExpenses();
    selectedMonthIndex = expensesMonth.indexWhere(
      (month) => month.month == widget.initialMonth,
    );
    if (selectedMonthIndex == -1) selectedMonthIndex = 0;
    _filterExpenses();
  }

  void _filterExpenses() {
    final selectedMonth = expensesMonth[selectedMonthIndex];

    final category = selectedMonth.categories.firstWhere(
      (cat) => cat.name == widget.category.name,
      orElse: () => throw Exception('Categoría no encontrada'),
    );

    setState(() {
      filteredExpenses = category.expenses;
      categoryTotal = category.total;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedMonth = expensesMonth[selectedMonthIndex];
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          widget.category.name,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
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
                      _filterExpenses();
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
          Expanded(
            flex: 2,
            child: CustomPaint(
              size: Size(280, MediaQuery.of(context).size.width),
              painter: DoughnutChartPainter(
                monthActual: selectedMonth.month,
                totalAmount: categoryTotal,
                categories: [
                  Category(
                    name: widget.category.name,
                    total: categoryTotal,
                    icon: widget.category.icon,
                    color: widget.category.color,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredExpenses.length,
              itemBuilder: (context, index) {
                final expense = filteredExpenses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: AppColors.backgroundColor,
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: widget.category.color.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.category.icon,
                        color: widget.category.color,
                      ),
                    ),
                    title: Column(
                      children: [
                        Text(
                          expense.place,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          widget.category.name,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    trailing: Column(
                      children: [
                        SizedBox(height: 9),
                        Text(
                          'Gs. ${expense.amount.toStringAsFixed(0)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Text(
                          dateFormat.format(expense.dateTime),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        )
                      ],
                    ),
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
