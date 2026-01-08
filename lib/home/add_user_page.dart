import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();

  void saveUser() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        roleController.text.isEmpty) {
      showMessage("All fields are required");
      return;
    }

    await FirebaseFirestore.instance.collection('users').add({
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'role': roleController.text.trim(),
    });

    showMessage("User added successfully");
    Navigator.pop(context);
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add User")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: roleController,
              decoration: const InputDecoration(labelText: "Role"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveUser,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
