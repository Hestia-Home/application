import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';

abstract class ILocalDataSourceAuth {
  Future<void> setAuthToken(String authToken);
  Future<void> setAuthTokenValidity(DateTime authTokenValidity);
  void setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn});
  UserEntity getUser();
  Future<String> getAuthTokenValidity();
  Future<String> getAuthToken();
  Future<bool> authenticate();
  Future<bool> isSignedIn();
}
