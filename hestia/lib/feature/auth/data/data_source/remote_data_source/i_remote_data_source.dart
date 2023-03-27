import 'package:dio/dio.dart';

abstract class IRemoteDataSource {
  Future<Response> registerNewUser(
      {required String username,
      required String password,
      required String email,
      required bool isVerified,
      required bool isSuperUser});
  Future<Response> authenticate(String username, String password);
}
