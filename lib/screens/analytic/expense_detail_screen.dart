import 'package:e_club/components/analytic/expense_title_card.dart';
import 'package:e_club/models/expense_item.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:e_club/utils/format_datetime.dart';
import 'package:flutter/material.dart';

class ExpenseDetailScreen extends StatelessWidget {
  final ExpenseItem expenseItem;
  const ExpenseDetailScreen({super.key, required this.expenseItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          ExpenseTitleCard(
            place: expenseItem.place,
            amount: expenseItem.amount,
          ),
          const SizedBox(height: 18),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Operación:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      expenseItem.place,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fecha: ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      DateFormatter.formatDate(expenseItem.dateTime),
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hora: ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      DateFormatter.formatTime(expenseItem.dateTime),
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cod. de referencia: ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      expenseItem.codeReference.toString(),
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
