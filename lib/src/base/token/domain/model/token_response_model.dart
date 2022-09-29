class TokenResponseModel {
  final String token;
  final String refreshToken;
  final int expiration;

  TokenResponseModel({
    required this.token,
    required this.refreshToken,
    required this.expiration,
  });
}
