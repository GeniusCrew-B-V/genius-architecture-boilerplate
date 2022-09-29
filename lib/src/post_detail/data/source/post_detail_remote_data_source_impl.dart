import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:baseproject/src/base/models/posts/posts_exceptions.dart';
import 'package:baseproject/src/post_detail/data/source/post_detail_data_source.dart';
import 'package:dio/dio.dart';

class PostDetailDataSourceImpl extends PostDetailDataSource {
  final Dio _dio;

  PostDetailDataSourceImpl(this._dio);

  Future<PostModelResponse> getPostDetail(String id) async {
    try {
      Map<String, dynamic> temporaryFilters = {
        "postId": "1234",
      };
      final Response response =
          await _dio.get("/v1/post", queryParameters: temporaryFilters);

      PostModelResponse post = PostModelResponse.fromJson(response.data);
      return post;
    } catch (err) {
      if (err == "no_postData_data") {
        throw PostsExceptions.genericError;
      } else
        throw err;
    }
  }
}
