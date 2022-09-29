import 'package:baseproject/src/base/models/posts/post_model_response.dart';

abstract class PostDetailDataSource {
  Future<PostModelResponse> getPostDetail(String id);
}
