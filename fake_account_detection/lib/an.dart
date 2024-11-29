import 'package:fake_account_detection/login%20and%20signup/screen/homescreen.dart';
import 'package:fake_account_detection/login%20and%20signup/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FakeAccount extends StatelessWidget {
  const FakeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the auth state
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            // If a user is signed in, navigate to HomeScreen
            return const HomeScreen();
          } else {
            // If no user is signed in, navigate to LoginScreen
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
