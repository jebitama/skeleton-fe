import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/modules/homepage/controllers/post_controller.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      init: PostController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Posts Module'),
          ),
          body: _buildPostsList(controller),
        );
      },
    );
  }

  Widget _buildPostsList(PostController controller) {
    if (controller.isLoading.isTrue) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: controller.posts.length,
        itemBuilder: (context, index) {
          final post = controller.posts[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            ),
          );
        },
      );
    }
  }
}
