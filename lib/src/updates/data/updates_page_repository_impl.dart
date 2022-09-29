import 'package:baseproject/src/base/models/posts/posts_filter_model.dart';
import 'package:baseproject/src/base/models/posts/posts_response.dart';

import '../domain/updates_page_repository.dart';
import 'source/updates_page_data_source.dart';

class UpdatesPageRepositoryImpl extends UpdatesPageRepository {
  final UpdatesPageDataSource _updatesPageRemoteDataSource;

  UpdatesPageRepositoryImpl(this._updatesPageRemoteDataSource);

  Future<PostsDetailResponse> getPosts(PostsFilterModel filters) => _updatesPageRemoteDataSource.getPosts(filters);
}
