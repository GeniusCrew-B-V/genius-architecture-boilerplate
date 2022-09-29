import 'package:baseproject/src/base/models/posts/posts_filter_model.dart';
import 'package:baseproject/src/base/models/posts/posts_response.dart';
import 'package:dio/dio.dart';

import 'updates_page_data_source.dart';

class UpdatesPageDataSourceImpl extends UpdatesPageDataSource {
  final Dio _dio;

  UpdatesPageDataSourceImpl(this._dio);

  Future<PostsDetailResponse> getPosts(PostsFilterModel filters) async {
    try {
      Map<String, dynamic> temporaryFilters = {"pageNumber": filters.pageNumber, "totalPerPage": filters.totalPerPage};
      // var queryPar = filters.toJson();
      final Response response = await _dio.get("/v1/posts", queryParameters: temporaryFilters);
      // Map<String, dynamic> response = {};
      // if (filters.pageNumber == null)
      //   response = FakeDatas.fakePostData1;
      //else
      //    response = FakeDatas.fakePostData2;

      PostsDetailResponse posts = PostsDetailResponse.fromJson(response.data); //response.data);
      return posts;
    } catch (error, stack) {
      print(error);
      print(stack);
      return Future.error(error);
    }
  }
}
