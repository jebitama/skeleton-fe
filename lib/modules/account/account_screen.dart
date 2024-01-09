import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Module'),
      ),
      body: const Center(
        child: Text('Account Module Content'),
      ),
    );
  }
}
