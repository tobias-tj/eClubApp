import 'package:e_club/components/account/custom_app_bar_clipper.dart';
import 'package:e_club/components/account/input_account.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginAccountScreen extends StatefulWidget {
  const LoginAccountScreen({super.key});

  @override
  State<LoginAccountScreen> createState() => _LoginAccountScreenState();
}

class _LoginAccountScreenState extends State<LoginAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          PhysicalShape(
            clipper: CustomAppBarClipper(),
            color: AppColors.textColor,
            elevation: 8,
            shadowColor: AppColors.textColor.withOpacity(0.5),
            child: Container(
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/eclub-logo.png',
                      width: 200,
                      height: 200,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: AppColors.redPrimaryColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding:
                EdgeInsets.only(top: size.height * 0.4, left: 20, right: 20),
            child: Column(
              children: [
                InputAccount(
                    inputController: _emailController,
                    hintText: "Ingresar Correo Electrónico",
                    isPass: false,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 20),
                InputAccount(
                  hintText: "Ingresar Contraseña",
                  inputController: _passwordController,
                  isPass: true,
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 25),
                TextButton(
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Olvidates tu contraseña?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.redPrimaryLightColor,
                        ),
                      ),
                      SizedBox(width: 4),
                      const Text(
                        'Recuperar Cuenta',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.redPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.redPrimaryColor,
                      foregroundColor: AppColors.textColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () => context.pushReplacementNamed('home'),
                    child: Text(
                      'Sign In',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  onPressed: () => context.goNamed('register'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No tienes una cuenta?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.redPrimaryLightColor,
                        ),
                      ),
                      SizedBox(width: 4),
                      const Text(
                        'Register Now',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.redPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
