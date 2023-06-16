import 'model/refresh_token_request_model.dart';
import 'model/token_response_model.dart';

abstract class TokenRepository {
  Future<TokenResponseModel> updateToken(RefreshTokenRequestModel tokenModel);
  Future<String?> getToken();
  Future<void> saveToken(String token, String refreshToken, int expiration);
  Future<void> deleteToken();
}
