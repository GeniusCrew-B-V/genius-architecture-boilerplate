import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/token_request_model.dart';
import 'token_local_data_source.dart';

class TokenLocalDataSourceImpl extends TokenLocalDataSource {
  final SharedPreferences prefs;

  TokenLocalDataSourceImpl(this.prefs);

  final String _tokenKey = "token";
  final String _refreshTokenKey = "refreshToken";
  final String _tokenExpiredTimeKey = "tokenExpiredKey";
  final String _tokenExpiredDateKey = "tokenExpiredDateKey";

  @override
  String? getToken() {
    final bool containsToken = prefs.containsKey(_tokenKey);
    if (containsToken) {
      final String? token = prefs.getString(_tokenKey);
      return token;
    } else {
      return null;
    }
  }

  @override
  Future<void> deleteToken() async {
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_tokenExpiredTimeKey);
    await prefs.remove(_tokenExpiredDateKey);
  }

  @override
  Future<void> saveToken(TokenRequestModel tokenModel) async {
    await prefs.setString(_tokenKey, tokenModel.token);
    await prefs.setString(_refreshTokenKey, tokenModel.refreshToken);
    await prefs.setInt(_tokenExpiredTimeKey, tokenModel.expiration);
    await prefs.setString(_tokenExpiredDateKey, DateTime.now().toString());
  }

  @override
  bool? isTokenExpired() {
    int? tokenExpiredTime = prefs.getInt(_tokenExpiredTimeKey);
    String? tokenExpiredDate = prefs.getString(_tokenExpiredDateKey);
    if (tokenExpiredTime != null && tokenExpiredDate != null) {
      DateTime oldDate = DateTime.parse(tokenExpiredDate);
      DateTime now = DateTime.now();
      return now.difference(oldDate).inSeconds >= tokenExpiredTime;
    }
    return null;
  }

  @override
  String? getRefreshToken() {
    final bool containsToken = prefs.containsKey(_refreshTokenKey);
    if (containsToken) {
      final String? refreshToken = prefs.getString(_refreshTokenKey);
      return refreshToken;
    } else {
      return null;
    }
  }
}
