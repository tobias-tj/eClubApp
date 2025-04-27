import 'package:animate_do/animate_do.dart';
import 'package:e_club/components/welcome/onboarding_item.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      icon: Icons.credit_card,
      title: 'Comprá con tu tarjeta virtual Rojita',
      description: 'Usala antes de recibir tu tarjeta física.',
    ),
    OnboardingItem(
      icon: Icons.account_balance_wallet,
      title: 'Enviá y recibí dinero',
      description: 'Gratis y en cualquier momento.',
    ),
    OnboardingItem(
      icon: Icons.payment,
      title: 'Pagá servicios y recargá tu línea',
      description: 'Todo desde tu celular de manera simple.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    item: _onboardingItems[index],
                    isLastPage: index == _onboardingItems.length - 1,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingItems.length,
                  (index) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? AppColors.redPrimaryColor
                          : Color.fromRGBO(223, 10, 92, 0.503),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
              child: FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.redPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      if (_currentPage < _onboardingItems.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        context.pushReplacementNamed('register');
                      }
                    },
                    child: Text(
                      _currentPage == _onboardingItems.length - 1
                          ? 'Comenzar'
                          : 'Siguiente',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
