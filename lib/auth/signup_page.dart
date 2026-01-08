import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool isLoading = false;

  void signup() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      showMessage("All fields are required");
      return;
    }

    if (passwordController.text != confirmController.text) {
      showMessage("Passwords do not match");
      return;
    }

    try {
      setState(() => isLoading = true);

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      showMessage("Signup successful. Please login.");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showMessage(e.message ?? "Signup failed");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType:
              isPassword ? TextInputType.text : TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person_add, size: 70),
              const SizedBox(height: 16),

              buildInputField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
              ),

              buildInputField(
                controller: passwordController,
                label: "Password",
                icon: Icons.lock,
                isPassword: true,
              ),

              buildInputField(
                controller: confirmController,
                label: "Confirm Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : signup,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Signup"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
