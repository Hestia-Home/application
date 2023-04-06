import 'package:flutter_smarthome/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';

class RegisterNewUserUsecase {
  IRemoteDataSourceAuth remoteDataSource;
  RegisterNewUserUsecase({required this.remoteDataSource});

  void call(
          {required String username,
          required String email,
          required String password,
          required bool isVerified,
          required bool isSuperUser}) =>
      remoteDataSource.registerNewUser(
          isSuperUser: isSuperUser,
          username: username,
          isVerified: isVerified,
          email: email,
          password: password);
}
