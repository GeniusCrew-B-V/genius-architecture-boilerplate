import 'package:dio/dio.dart';

import '../../domain/model/login_exception.dart';
import '../../domain/model/login_response_model.dart';
import 'login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  final Dio _dio;

  LoginDataSourceImpl(this._dio);

  Future<LoginResponseModel> loginUser(String email, String password) async {
    try {
      final networkModel = {"email": email, "password": password};
      final response = await _dio.post(
        "/v1/login",
        data: networkModel,
      );
      LoginResponseModel loginResponse = LoginResponseModel.fromJson(response.data);
      return loginResponse;
    } catch (err) {
      //TODO insert the read error responses
      if (err == "user_not_found") {
        throw LoginException.userNotFound;
      } else if (err == "wrong_password") {
        throw LoginException.wrongPassword;
      } else if (err == "email_not_verified") {
        throw LoginException.emailNotVerified;
      } else if (err == "too_many_request") {
        throw LoginException.tooManyRequest;
      } else
        throw LoginException.genericError;
    }
  }
}
