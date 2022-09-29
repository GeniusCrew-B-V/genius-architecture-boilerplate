import 'package:dio/dio.dart';

import '../../domain/model/base_user_response_model.dart';
import 'base_remote_data_source.dart';

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio _dio;

  BaseRemoteDataSourceImpl(this._dio);

  @override
  Future<BaseUserResponseModel> initUserDatas() async {
    try {
      final response = await _dio.get("/v1/profile");
      print(response.data);
      BaseUserResponseModel res = BaseUserResponseModel.fromJson(response.data);
      return res;
    } catch (err) {
      //TODO insert the correct exceptions

      throw UnimplementedError();
    }
  }
}
