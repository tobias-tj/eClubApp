import 'dart:math';
import 'package:e_club/models/category.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:e_club/utils/format_currency.dart';
import 'package:flutter/material.dart';

class DoughnutChartPainter extends CustomPainter {
  final List<Category> categories;
  final double totalAmount;
  final TextStyle? totalTextStyle;
  final String monthActual;
  final Category? selectedCategory;

  DoughnutChartPainter(
      {required this.categories,
      required this.totalAmount,
      this.totalTextStyle,
      required this.monthActual,
      this.selectedCategory});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.5;

    double startAngle = -pi / 2;
    final double total = categories.fold(0, (sum, item) => sum + item.total);
    final double radius = size.width / 2;
    final double holeRadius = radius * 0.5;

    for (var category in categories) {
      final sweepAngle = (category.total / total) * 2 * pi;
      if (selectedCategory == category) {
        paint.color = category.color.withOpacity(0.8);
        paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 10);
      } else {
        paint.color = category.color;
        paint.maskFilter = null;
      }

      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      Paint holePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        holeRadius,
        holePaint,
      );

      double middleAngle = startAngle + sweepAngle / 2;
      double x = size.width / 2 + (radius + holeRadius) / 2 * cos(middleAngle);
      double y = size.height / 2 + (radius + holeRadius) / 2 * sin(middleAngle);

      _drawCategoryIcon(canvas, x, y, category);
      startAngle += sweepAngle;
    }

    _drawCenterTexts(canvas, size, totalAmount, holeRadius);
  }

  void _drawCenterTexts(
      Canvas canvas, Size size, double total, double holeRadius) {
    final totalText = formatCurrency(total);
    final maxWidth = holeRadius * 1.8;

    final monthStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    );

    final totalStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.redPrimaryColor,
    );

    final monthPainter = TextPainter(
      text: TextSpan(
        text: monthActual,
        style: monthStyle,
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    monthPainter.layout(maxWidth: maxWidth);

    final totalPainter = TextPainter(
      text: TextSpan(
        text: totalText,
        style: totalStyle,
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    totalPainter.layout(maxWidth: maxWidth);

    final totalHeight = monthPainter.height + totalPainter.height;
    final centerY = size.height / 2 - totalHeight / 2;

    monthPainter.paint(
      canvas,
      Offset(
        size.width / 2 - monthPainter.width / 2,
        centerY,
      ),
    );

    totalPainter.paint(
      canvas,
      Offset(
        size.width / 2 - totalPainter.width / 2,
        centerY + monthPainter.height,
      ),
    );
  }

  void _drawCategoryIcon(Canvas canvas, double x, double y, Category category) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(category.icon.codePoint),
        style: TextStyle(
          fontSize: 30,
          fontFamily: category.icon.fontFamily,
          package: category.icon.fontPackage,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(x - textPainter.width / 2, y - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant DoughnutChartPainter oldDelegate) {
    return oldDelegate.categories != categories ||
        oldDelegate.totalAmount != totalAmount ||
        oldDelegate.monthActual != monthActual ||
        oldDelegate.selectedCategory != selectedCategory;
  }
}
