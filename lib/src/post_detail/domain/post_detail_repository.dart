import 'package:baseproject/src/base/models/posts/post_model_response.dart';

abstract class PostDetailRepository {
  Future<PostModelResponse> getPostDetail(String id);
}
