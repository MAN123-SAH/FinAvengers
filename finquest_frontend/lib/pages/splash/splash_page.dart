import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    print("Splash screen loaded");

    // Navigate to onboarding after 2 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding1');
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Building SplashPage");
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/f1.png', // ✅ Fixed path
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to FinQuest',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E23AA),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Budgeting made fun and smart!',
              style: TextStyle(fontSize: 16, color: Color(0xFFFF6B6B)),
            ),
          ],
        ),
      ),
    );
  }
}
