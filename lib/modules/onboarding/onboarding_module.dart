import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingModule extends StatelessWidget {
  OnboardingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) {
        // Build your Onboarding module UI here
        return Scaffold(
          appBar: AppBar(
            title: Text('Onboarding Module'),
          ),
          body: Center(
            child: Text('Onboarding Module Content'),
          ),
        );
      },
    );
  }
}
