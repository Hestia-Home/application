import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/data/model/user_model.dart';
import 'package:flutter_smarthome/feature/auth/domain/entity/user_entity.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LocalDataSource implements ILocalDataSource {
  final FlutterSecureStorage secureStorage;
  final LocalAuthentication authentication;

  LocalDataSource({required this.authentication, required this.secureStorage});

  @override
  Future<bool> authenticate() async {
    bool didAuthenticate = false;
    final bool canAuthenticateWithBiometrics =
        await authentication.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics ||
        await authentication.isDeviceSupported();
    if (canAuthenticate) {
      try {
        didAuthenticate = await authentication.authenticate(
            localizedReason: 'Авторизуйтесь, чтобы продолжить',
            authMessages: <AuthMessages>[
              const AndroidAuthMessages(
                  signInTitle: "Необходима аутентификация!",
                  biometricHint: "",
                  cancelButton: "Нет, спасибо!")
            ],
            options: const AuthenticationOptions(
                stickyAuth: false, useErrorDialogs: true));
      } catch (e) {
        Exception(e.toString());
      }
    }
    return didAuthenticate;
  }

  @override
  Future<UserEntity> getUser() async {
    final userData = await secureStorage.read(key: 'user') ?? '';
    final UserEntity user = UserModel.fromJson(jsonDecode(userData));
    return user;
  }

  @override
  Future<void> setAuthToken(String authToken) async {
    await secureStorage.write(key: 'auth_token', value: authToken);
  }

  @override
  Future<void> setAuthTokenValidity(DateTime authTokenValidity) async {
    await secureStorage.write(
        key: 'auth_token_validity', value: authTokenValidity.toString());
  }

  @override
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn}) async {
    final String userModel =
        UserModel(name: userName, userid: userId, isLoggedIn: isLoggedIn)
            .toJson()
            .toString();
    await secureStorage.write(key: 'user', value: userModel);
  }

  @override
  Future<String> getAuthToken() async {
    final authToken = await secureStorage.read(key: 'auth_token') ?? '';
    return authToken;
  }

  @override
  Future<String> getAuthTokenValidity() async {
    final tokenValidity =
        await secureStorage.read(key: 'auth_token_validity') ?? '';
    return tokenValidity;
  }

  @override
  Future<bool> isSignedIn() async {
    final authToken = await getAuthToken();
    final tokenValidity = await getAuthTokenValidity();
    final currentDate = DateTime.now();
    final bool isSignedIn;
    if (tokenValidity.isNotEmpty) {
      final authTokenValidity = DateTime.parse(tokenValidity);
      isSignedIn =
          authToken.isNotEmpty && authTokenValidity.isAfter(currentDate);
    } else {
      isSignedIn = false;
    }

    return isSignedIn;
  }
}
