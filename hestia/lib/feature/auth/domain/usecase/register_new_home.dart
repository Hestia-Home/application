import 'package:flutter_smarthome/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';

class RegisterNewUserUsecase {
  IRemoteDataSource remoteDataSource;
  RegisterNewUserUsecase({required this.remoteDataSource});

  void call(
          {required String username,
          required String email,
          required String password,
          required bool isVerified}) =>
      remoteDataSource.registerNewUser(
          username: username,
          isVerified: isVerified,
          email: email,
          password: password);
}
