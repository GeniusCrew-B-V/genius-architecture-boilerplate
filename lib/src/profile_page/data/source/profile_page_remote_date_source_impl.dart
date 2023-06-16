import 'package:dio/dio.dart';

import '../../../base/base_navigation/domain/model/base_user_response_model.dart';
import '../../domain/model/profile_page_user_request_model.dart';
import 'profile_page_data_source.dart';

class ProfilePageDataSourceImpl extends ProfilePageDataSource {
  final Dio _dio;
  ProfilePageDataSourceImpl(this._dio,);

  Future<BaseUserResponseModel> saveUserChanges(ProfilePageUserRequestModel pageUserRequestModel) async {
    try {
      final response = await _dio.put(
        "/v1/profile",
        queryParameters: pageUserRequestModel.toJson(),
      );
      print(response.data);
      BaseUserResponseModel responseModel = BaseUserResponseModel.fromJson(response.data);
      return responseModel;
    } catch (e) {
      rethrow;
    }
  }
}
