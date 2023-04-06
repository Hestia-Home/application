import 'package:flutter_smarthome/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:flutter_smarthome/feature/auth/domain/repository/i_remote_repository.dart';

class RemoteRepoistoryAuth implements IRemoteRepositoryAuth {
  IRemoteDataSourceAuth remoteDataSource;
  RemoteRepoistoryAuth({required this.remoteDataSource});

  @override
  Future<void> registerNewUser(
      {required String username,
      required String email,
      required String password,
      required bool isVerified,
      required bool isSuperUser}) async {
    await remoteDataSource.registerNewUser(
        isSuperUser: isSuperUser,
        username: username,
        isVerified: isVerified,
        password: password,
        email: email);
  }
}
