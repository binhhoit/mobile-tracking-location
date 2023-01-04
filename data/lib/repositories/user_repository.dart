abstract class UserRepository {
  Future<bool> loginWithGmail(String email, String password);
  Future<bool> registerWithGmail(String email, String password);
}
