import 'package:dio/dio.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/remote_data_source/i_remote_data_source.dart';

const String login = "http://10.0.2.2:8000/auth/jwt/login";
const String register = 'http://10.0.2.2:8000/auth/register';

class RemoteDataSourceAuth implements IRemoteDataSourceAuth {
  final Dio dio;

  RemoteDataSourceAuth(this.dio);

  @override
  Future<Response> registerNewUser(
      {required String username,
      required String password,
      required String email,
      required bool isVerified,
      required bool isSuperUser}) async {
    dynamic response;
    try {
      response = await dio.post(register, data: {
        "username": username,
        "password": password,
        "email": email,
        "is_verified": isVerified,
        "is_superuser": isSuperUser,
        "is_active": true
      });
    } catch (e) {
      response = e.toString();
    }
    return response;
  }

  @override
  Future<Response> authenticate(String username, String password) async {
    dynamic response;
    try {
      response = await dio
          .post(register, data: {"username": username, "password": password});
    } catch (e) {
      response = e.toString();
    }
    return response;
  }
}
