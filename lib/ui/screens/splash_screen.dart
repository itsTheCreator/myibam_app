import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myibam_app/ui/screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Attendre 3 secondes avant de passer à l'écran de connexion
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            // Cercle bleu en haut à gauche
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFF45A3C6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Demi-cercle orange en haut à droite
            Positioned(
              top: -60,
              right: -60,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF6A4C),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Cercles en bas
            Positioned(
              bottom: -60,
              left: -30,
              right: -30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color(0xFF45A3C6),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF6A4C),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            // Logo MY IBAM centré
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}