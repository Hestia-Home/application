abstract class IRemoteRepositoryAuth {
  Future<void> registerNewUser(
      {required String username,
      required String email,
      required String password,
      required bool isVerified,
      required bool isSuperUser});
}
