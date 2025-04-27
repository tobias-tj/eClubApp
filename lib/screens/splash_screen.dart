import 'package:animate_do/animate_do.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4000), () {
      _checkSession();
    });
  }

  Future<void> _checkSession() async {
    context.pushReplacement('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.redPrimaryColor,
              AppColors.redPrimaryDarkColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/animations/eClubLogo.json",
              repeat: false,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            BounceIn(
              duration: Duration(seconds: 2),
              child: Image.asset(
                "assets/images/eclub-logo-white.png",
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomCenter,
              child: FadeIn(
                delay: const Duration(milliseconds: 2500),
                child: SizedBox(
                  width: size.width,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.textColor,
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
