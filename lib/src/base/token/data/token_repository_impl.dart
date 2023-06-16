import 'package:baseproject/src/base/token/data/remote/token_remote_data_source.dart';
import 'package:baseproject/src/base/token/domain/model/refresh_token_request_model.dart';

import '../domain/model/token_request_model.dart';
import '../domain/model/token_response_model.dart';
import '../domain/token_repository.dart';
import 'local/token_local_data_source.dart';

class TokenRepositoryImpl extends TokenRepository {
  final TokenLocalDataSource _localDataSource;
  final TokenRemoteDataSource _remoteDataSource;

  TokenRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<TokenResponseModel> updateToken(RefreshTokenRequestModel tokenModel) => _remoteDataSource.updateToken(tokenModel);

  @override
  Future<String?> getToken() async {
    try {
      final isTokenExpired = _localDataSource.isTokenExpired();
      if (isTokenExpired != null) {
        if (isTokenExpired) {
          return null;
        } else {
          return _localDataSource.getToken();
        }
      } else {
        return null;
      }
    } catch (err) {
      print('error: $err');
      return null;
    }
  }

  @override
  Future<void> deleteToken() => _localDataSource.deleteToken();

  @override
  Future<void> saveToken(
    String token,
    String refreshToken,
    int expiration,
  ) async {
    final tokenModel = TokenRequestModel(
      token: token,
      refreshToken: refreshToken,
      expiration: expiration,
    );
    await _localDataSource.saveToken(tokenModel);
  }
}
