import 'package:flutter_smarthome/feature/auth/domain/entity/user_entity.dart';

abstract class ILocalDataSource {
  Future<void> setAuthToken(String authToken);
  Future<void> setAuthTokenValidity(DateTime authTokenValidity);
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn});
  Future<UserEntity> getUser();
  Future<String> getAuthTokenValidity();
  Future<String> getAuthToken();
  Future<bool> authenticate();
  Future<bool> isSignedIn();
}
