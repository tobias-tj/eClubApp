import 'dart:math';

import 'package:e_club/models/category.dart';
import 'package:e_club/components/analytic/doughnut_chart_painter.dart';
import 'package:flutter/material.dart';

class InteractiveDoughnutChart extends StatefulWidget {
  final List<Category> categories;
  final double totalAmount;
  final String monthActual;
  final Function(Category) onCategorySelected;

  const InteractiveDoughnutChart({
    Key? key,
    required this.categories,
    required this.totalAmount,
    required this.monthActual,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _InteractiveDoughnutChartState createState() =>
      _InteractiveDoughnutChartState();
}

class _InteractiveDoughnutChartState extends State<InteractiveDoughnutChart> {
  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _handleTap(details, context.size!);
      },
      child: CustomPaint(
        size: Size(350, MediaQuery.of(context).size.width),
        painter: DoughnutChartPainter(
          monthActual: widget.monthActual,
          totalAmount: widget.totalAmount,
          categories: widget.categories,
          selectedCategory: _selectedCategory,
        ),
      ),
    );
  }

  void _handleTap(TapDownDetails details, Size size) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localPosition = box.globalToLocal(details.globalPosition);

    final center = Offset(size.width / 2, size.height / 2);
    final distance = (localPosition - center).distance;
    final radius = size.width / 2;
    final holeRadius = radius * 0.5;

    if (distance > holeRadius && distance <= radius) {
      double angle = atan2(
        localPosition.dy - center.dy,
        localPosition.dx - center.dx,
      );

      angle = (angle + pi / 2 + 2 * pi) % (2 * pi);

      final double total =
          widget.categories.fold(0, (sum, item) => sum + item.total);
      double startAngle = 0;

      for (var category in widget.categories) {
        final sweepAngle = (category.total / total) * 2 * pi;
        if (angle >= startAngle && angle <= startAngle + sweepAngle) {
          setState(() => _selectedCategory = category);
          widget.onCategorySelected(category);
          return;
        }
        startAngle += sweepAngle;
      }
    }
  }
}
