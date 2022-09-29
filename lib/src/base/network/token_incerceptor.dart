import 'package:dio/dio.dart';

import '../token/domain/token_repository.dart';

class TokenInterceptor extends Interceptor {
  final TokenRepository tokenRepository;

  TokenInterceptor(this.tokenRepository);

  @override
  void onRequest(options, handler) async {
    final String? token = await tokenRepository.getToken();
    if (token != null) {
      options.headers['authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}
