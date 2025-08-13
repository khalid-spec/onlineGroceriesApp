import 'package:flutter/material.dart';
import 'dart:async';

import 'package:onlinegroceriesapp/Home/GroceryHomePage.dart';
// استبدلها بصفحتك الرئيسية

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // انتظار 3 ثوانٍ ثم الانتقال
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const GroceryHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF53B175), // اللون الأخضر
      body: Center(
        child: LogoText(), // شعار التطبيق والنص
      ),
    );
  }
}

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.add, // ← غير موجود افتراضيًا، ستحتاج لصورة أو حزمة أيقونات
          color: Colors.white,
          size: 60,
        ),
        SizedBox(height: 20),
        Text(
          'nectar',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'online groceriet',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
