abstract class IRemoteRepository {
  Future<void> registerNewUser(
      {required String username,
      required String email,
      required String password,
      required bool isVerified});
  Future<void> connectToSmarthome();
}
