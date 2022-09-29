import '../../domain/model/token_request_model.dart';

abstract class TokenLocalDataSource {
  String? getToken();
  String? getRefreshToken();
  Future<void> saveToken(TokenRequestModel tokenModel);
  Future<void> deleteToken();
  bool? isTokenExpired();
}
