import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user['name']}"),
            Text("Email: ${user['email']}"),
            Text("Role: ${user['role']}"),
          ],
        ),
      ),
    );
  }
}
