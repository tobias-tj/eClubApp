import 'package:animate_do/animate_do.dart';
import 'package:e_club/components/analytic/build_analytic_card.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Análisis',
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedMenu05, color: Colors.grey),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(80),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.redPrimaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset('assets/images/topAnalitic.png'),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeIn(
                    duration: const Duration(milliseconds: 1000),
                    child: Center(
                      child: Text(
                        '¿Qué deseas revisar?',
                        style: TextStyle(
                          color: AppColors.redPrimaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: buildAnalyticCard(
                          context,
                          imagePath: 'assets/images/ingreso.png',
                          label: 'Ingresos',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed('expenses');
                        },
                        child: buildAnalyticCard(
                          context,
                          imagePath: 'assets/images/gasto.png',
                          label: 'Gastos',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
