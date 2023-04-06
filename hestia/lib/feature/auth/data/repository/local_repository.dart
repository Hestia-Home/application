import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/domain/repository/i_local_repository.dart';

class LocalRepositoryAuth implements ILocalRepositoryAuth {
  final ILocalDataSourceAuth localDataSource;

  LocalRepositoryAuth({required this.localDataSource});

  @override
  UserEntity getUser() {
    return localDataSource.getUser();
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
  void setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn}) {
    localDataSource.setUser(
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
