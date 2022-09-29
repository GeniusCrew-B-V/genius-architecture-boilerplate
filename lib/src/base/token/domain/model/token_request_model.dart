class TokenRequestModel {
  final String token;
  final String refreshToken;
  final int expiration;

  TokenRequestModel({
    required this.token,
    required this.refreshToken,
    required this.expiration,
  });
}
