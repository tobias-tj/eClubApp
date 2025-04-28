import 'package:animate_do/animate_do.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Análisis'),
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
                      InkWell(
                        onTap: () {},
                        child: _buildAnalyticCard(
                          context,
                          imagePath: 'assets/images/ingreso.png',
                          label: 'Ingresos',
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _buildAnalyticCard(
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

  Widget _buildAnalyticCard(BuildContext context,
      {required String imagePath, required String label}) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Card(
        color: AppColors.textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: AppColors.redPrimaryColor.withOpacity(0.2),
        elevation: 6,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.4,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 50),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.redPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
