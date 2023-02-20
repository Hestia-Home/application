abstract class IRemoteDataSource {
  Future<void> registerNewUser(
      {required String username,
      required String password,
      required String email,
      required bool isVerified});
  Future<void> connectToSmarthome();
}
