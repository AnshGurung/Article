abstract class AuthRepository {
  Future<bool> isAuthenticated();
  Future<void> clearToken();
}
