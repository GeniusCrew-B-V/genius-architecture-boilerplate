abstract class TokenRepository {
  Future<String?> getToken();
  Future<void> saveToken(String token, String refreshToken, int expiration);
  Future<void> deleteToken();
}
