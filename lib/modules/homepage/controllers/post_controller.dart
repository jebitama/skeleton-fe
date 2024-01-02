import 'package:get/get.dart';
import 'package:skeleton/modules/homepage/models/post_model.dart';
import 'package:skeleton/modules/homepage/services/post_service.dart';

class PostController extends GetxController {
  final PostService _postService = PostService();

  RxList<Post> posts = <Post>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final fetchedPosts = await _postService.fetchPosts();
      posts.assignAll(fetchedPosts);
    } catch (error) {
      print('Error fetching posts: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
