import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/auth/controllers/auth_controller.dart';

class AuthModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        // Build your authentication module UI here
        return Scaffold(
          appBar: AppBar(
            title: Text('Authentication Module'),
          ),
          body: Center(
            child: Text('Authentication Module Content'),
          ),
        );
      },
    );
  }
}
