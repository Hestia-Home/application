import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/domain/repository/i_local_repository.dart';

class LocalRepository implements ILocalRepository {
  final ILocalDataSource localDataSource;

  LocalRepository({required this.localDataSource});

  @override
  Future<UserEntity> getUser() async {
    return await localDataSource.getUser();
  }

  @override
  Future<void> setAuthToken(String authToken) async {
    await localDataSource.setAuthToken(authToken);
  }

  @override
  Future<void> setAuthTokenValidity(DateTime authTokenValidity) async {
    await localDataSource.setAuthTokenValidity(authTokenValidity);
  }

  @override
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn}) async {
    await localDataSource.setUser(
        userId: userId, userName: userName, isLoggedIn: isLoggedIn);
  }

  @override
  Future<String> getAuthToken() async {
    return await localDataSource.getAuthToken();
  }

  @override
  Future<String> getAuthTokenValidity() async {
    return await localDataSource.getAuthTokenValidity();
  }

  @override
  Future<bool> authenticate() async {
    return await localDataSource.authenticate();
  }

  @override
  Future<bool> isSignedIn() async {
    return await localDataSource.isSignedIn();
  }
}
