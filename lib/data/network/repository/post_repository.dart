

import 'package:ecom_print_store/data/models/post/post_list.dart';
import 'package:ecom_print_store/data/network/apis/posts/post_api.dart';

class PostRepository {
  // api objects
  final PostApi postApi;

  PostRepository({required this.postApi});

  Future<PostList> getPosts() async {
    return await postApi.getPosts().then((postsList) {
      return postsList;
    }).catchError((error) => throw error);
  }
}
