import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Module'),
      ),
      body: const Center(
        child: Text('Explore Module Content'),
      ),
    );
  }
}
