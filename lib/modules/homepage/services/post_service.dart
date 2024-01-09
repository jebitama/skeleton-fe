import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:skeleton/modules/homepage/models/post_model.dart';

class PostService {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio
          .get('https://my-json-server.typicode.com/typicode/demo/posts');
      final List<dynamic> data = response.data;
      if (kDebugMode) {
        print('postResp $response');
      }
      final List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
      if (kDebugMode) {
        print('posts $posts');
      }
      return posts;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching posts: $error');
      }
      throw Exception('Failed to fetch posts');
    }
  }
}
