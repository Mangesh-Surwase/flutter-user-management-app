import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/login_page.dart';
import 'user_list_page.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          // Theme switch
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return Switch(
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              );
            },
          ),

          // Logout button
          IconButton(
            tooltip: "Logout",
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Manage Users"),
                subtitle: const Text("Add, view and delete users"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const UserListPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
