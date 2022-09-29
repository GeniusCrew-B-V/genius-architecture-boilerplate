import 'package:baseproject/src/base/models/posts/posts_filter_model.dart';
import 'package:baseproject/src/base/models/posts/posts_response.dart';

abstract class UpdatesPageDataSource {
  Future<PostsDetailResponse> getPosts(PostsFilterModel filters);
}
