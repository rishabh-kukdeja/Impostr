import 'package:fake_account_detection/login%20and%20signup/screen/login_page.dart';
import 'package:fake_account_detection/login%20and%20signup/screen/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FakeAccountDetectorApp());
}

class FakeAccountDetectorApp extends StatelessWidget {
  const FakeAccountDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(), // Directly set to LoginScreen
    );
  }
}