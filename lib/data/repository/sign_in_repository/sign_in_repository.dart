abstract class SignInRepository {
  Future<bool> loginWithKakao();
  Future<void> logout();
}
