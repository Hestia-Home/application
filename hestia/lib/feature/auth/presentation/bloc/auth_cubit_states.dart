import 'package:equatable/equatable.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/is_signed_in_usecase.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/log_in_by_biometrics.dart';

abstract class AuthCubitStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthCubitStates {
  final IsSignedIn isSignedIn;
  AuthInitialState(this.isSignedIn);

  @override
  List<Object?> get props => [isSignedIn];
}

class AuthSignInState extends AuthCubitStates {
  @override
  List<Object?> get props => [];
}

class AuthSigningInState extends AuthCubitStates {
  final String username;
  final String password;

  AuthSigningInState({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class AuthSignUpState extends AuthCubitStates {
  @override
  List<Object?> get props => [];
}

class AuthSigningUpState extends AuthCubitStates {
  final String username;
  final String email;
  final String password;

  AuthSigningUpState(
      {required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [username, email, password];
}

class AuthBiometricsState extends AuthCubitStates {
  final LoginUsecase loginUsecase;

  AuthBiometricsState(this.loginUsecase);

  @override
  List<Object?> get props => [loginUsecase];
}
