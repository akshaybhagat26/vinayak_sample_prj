import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(36.0),
          child: Text('Welcome to the Account Settings screen'),
        ),
      ),
    );
  }
}