import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:baseproject/src/post_detail/data/source/post_detail_data_source.dart';
import 'package:baseproject/src/post_detail/domain/post_detail_repository.dart';

class PostDetailRepositoryImpl extends PostDetailRepository {
  final PostDetailDataSource _postDetailDataSource;

  PostDetailRepositoryImpl(this._postDetailDataSource);

  Future<PostModelResponse> getPostDetail(String id) =>
      _postDetailDataSource.getPostDetail(id);
}
