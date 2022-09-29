import '../../domain/model/refresh_token_request_model.dart';
import '../../domain/model/token_response_model.dart';

abstract class TokenRemoteDataSource {
  Future<TokenResponseModel> updateToken(RefreshTokenRequestModel tokenModel);
}
