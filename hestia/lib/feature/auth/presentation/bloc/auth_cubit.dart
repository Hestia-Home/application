import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/is_signed_in_usecase.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/log_in_by_biometrics.dart';
import 'package:flutter_smarthome/feature/auth/presentation/bloc/auth_cubit_states.dart';

class AuthCubit extends Cubit<AuthCubitStates> {
  final ILocalDataSource localDataSource;
  final IsSignedIn isSignedIn;
  final LoginUsecase loginUsecase;
  bool didAuthenticate;

  AuthCubit(
      {required this.isSignedIn,
      required this.localDataSource,
      required this.loginUsecase,
      this.didAuthenticate = false})
      : super(AuthInitialState(isSignedIn));

  Future<void> navigateToAuthPages() async {
    final isAuthenticated = await isSignedIn.call();
    if (!isAuthenticated) {
      emit(AuthBiometricsState(loginUsecase));
      if (state is AuthBiometricsState) {
        await Future.delayed(const Duration(seconds: 5));
        didAuthenticate = await loginUsecase.loginByBiometrics();
      }
    } else {
      emit(AuthSignInState());
    }
  }

  void signIn({required String username, required String password}) {
    emit(AuthSigningInState(username: username, password: password));
  }

  void navigateToRegistrationPage() {
    emit(AuthSignUpState());
  }

  void signUp(
      {required String username,
      required String email,
      required String password}) {
    emit(AuthSigningUpState(
        username: username, email: email, password: password));
  }
}
