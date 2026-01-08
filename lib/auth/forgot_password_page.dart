import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  bool isLoading = false;

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      showMessage("Please enter your email");
      return;
    }

    try {
      setState(() => isLoading = true);

      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      showMessage("Password reset email sent");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showMessage(e.message ?? "Failed to send reset email");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Enter your email to receive password reset link",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : resetPassword,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Send Reset Email"),
            ),
          ],
        ),
      ),
    );
  }
}
