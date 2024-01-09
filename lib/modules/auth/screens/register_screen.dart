import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/auth/controllers/register_form_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) {
        // Build your authentication module UI here
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: const Center(
            child: Text('Register Content'),
          ),
        );
      },
    );
  }
}
