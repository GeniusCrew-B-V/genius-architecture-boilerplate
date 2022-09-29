import '../../domain/model/token_response_model.dart';
import '../model/network_token_response_model.dart';

extension NetworkTokenResponseModelExt on NetworkTokenResponseModel {
  TokenResponseModel get toDomain {
    return TokenResponseModel(
      expiration: expiration,
      refreshToken: refreshToken,
      token: token,
    );
  }
}
