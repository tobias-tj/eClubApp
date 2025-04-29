import 'package:e_club/styles/app_colors.dart';
import 'package:e_club/utils/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpenseTitleCard extends StatelessWidget {
  final String place;
  final double amount;
  const ExpenseTitleCard(
      {super.key, required this.place, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF00E51),
            Color(0xFFFF6720),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: AppColors.textColor, size: 28),
                  onPressed: () => context.pop(),
                )),
              ),
              Text(
                'Movimientos',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.textColor),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      place,
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 18),
                    ),
                    SizedBox(width: 28),
                    Text('ASUNCPR',
                        style:
                            TextStyle(color: AppColors.textColor, fontSize: 18))
                  ],
                ),
                SizedBox(height: 30),
                Text(formatCurrency(amount),
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }
}
