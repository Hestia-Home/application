import 'package:flutter_smarthome/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:flutter_smarthome/feature/auth/domain/repository/i_remote_repository.dart';

class RemoteRepoistory implements IRemoteRepository {
  IRemoteDataSource remoteDataSource;
  RemoteRepoistory({required this.remoteDataSource});

  @override
  Future<void> connectToSmarthome() async {
    await remoteDataSource.connectToSmarthome();
  }

  @override
  Future<void> registerNewUser(
      {required String username,
      required String email,
      required String password,
      required bool isVerified}) async {
    await remoteDataSource.registerNewUser(
        username: username,
        isVerified: isVerified,
        password: password,
        email: email);
  }
}
