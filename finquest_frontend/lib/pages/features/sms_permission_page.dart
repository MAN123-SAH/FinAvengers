import 'package:flutter/material.dart';

class SmsPermissionPage extends StatelessWidget {
  const SmsPermissionPage({super.key});

  void _grantPermission(BuildContext context) {
    // TODO: Implement actual SMS permission logic (Android only)
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _skip(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/sms_permission.png', // Add this image
              height: 240,
            ),
            const SizedBox(height: 40),
            const Text(
              "Allow SMS Access",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "FinQuest uses SMS access to automatically detect your transaction expenses. Your data stays on your device and is never shared.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => _grantPermission(context),
              icon: const Icon(Icons.sms),
              label: const Text("Grant Permission"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => _skip(context),
              child: const Text("Skip for now"),
            )
          ],
        ),
      ),
    );
  }
}
