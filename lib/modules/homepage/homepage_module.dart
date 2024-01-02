import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/homepage/controllers/post_controller.dart';
import 'screens/post_list_screen.dart';

class HomepageModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      init: PostController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Homepage Module'),
          ),
          body: _buildHomepageModuleContents(controller),
        );
      },
    );
  }

  Widget _buildHomepageModuleContents(PostController controller) {
    // Hypothetical container widget wrapping the PostListScreen
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome to the Homepage Module!'),
          // You can include additional widgets here as needed
          Divider(),
          PostListScreen(),
        ],
      ),
    );
  }
}
