import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/bike_rental/controllers/bike_rental_controller.dart';

class BikeRentalScreen extends StatelessWidget {
  const BikeRentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BikeRentalController>(
      builder: (controller) {
        // Build your authentication module UI here
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bike Rental Module'),
          ),
          body: const Center(
            child: Text('Bike Rental Module Content'),
          ),
        );
      },
    );
  }
}
