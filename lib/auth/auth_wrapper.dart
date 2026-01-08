import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/dashboard_page.dart';
import 'login_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // While checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If user is logged in
        if (snapshot.hasData) {
          return const DashboardPage();
        }

        // If user is logged out
        return const LoginPage();
      },
    );
  }
}
