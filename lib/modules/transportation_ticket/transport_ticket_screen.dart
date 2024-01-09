import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/car_rental/controllers/car_rental_controller.dart';

class TransportationScreen extends StatelessWidget {
  const TransportationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarRentalController>(
      builder: (controller) {
        // Build your authentication module UI here
        return Scaffold(
          appBar: AppBar(
            title: const Text('Transportation Ticket Module'),
          ),
          body: const Center(
            child: Text('Transportation Ticket Module Content'),
          ),
        );
      },
    );
  }
}
