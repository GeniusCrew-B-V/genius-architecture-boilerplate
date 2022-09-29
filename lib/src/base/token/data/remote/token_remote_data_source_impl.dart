import 'package:dio/dio.dart';

import '../../domain/model/refresh_token_request_model.dart';
import '../../domain/model/token_response_model.dart';
import '../dtx/network_token_response_model_ext.dart';
import '../model/network_refresh_token_request_model.dart';
import '../model/network_token_response_model.dart';
import 'token_remote_data_source.dart';

class TokenRemoteDataSourceImpl extends TokenRemoteDataSource {
  final Dio _dio;

  TokenRemoteDataSourceImpl(this._dio);

  @override
  Future<TokenResponseModel> updateToken(
    RefreshTokenRequestModel tokenModel,
  ) async {
    try {
      final networkTokenModel = NetworkRefreshTokenRequestModel(
        tokenModel.refreshToken,
      );
      final response = await _dio.get(
        "refresh",
        queryParameters: networkTokenModel.toJson(),
      );
      return NetworkTokenResponseModel.fromJson(response.data).toDomain;
    } catch (err) {
      rethrow;
    }
  }
}
