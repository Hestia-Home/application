import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_smarthome/core/navigation/auth/app_router.gr.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/data/repository/local_repository.dart';
import 'package:flutter_smarthome/feature/auth/domain/repository/i_local_repository.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/is_signed_in_usecase.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/log_in_by_biometrics.dart';
import 'package:flutter_smarthome/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:flutter_smarthome/main.dart';
import 'package:local_auth/local_auth.dart';

class ServiceLocator {
  static final i = ServiceLocator._();
  ServiceLocator._();
  late final myApp = MyApp(appRouter: appRouter);
  late final AuthCubit authCubit = AuthCubit(
      isSignedIn: isSignedIn,
      localDataSource: localDataSource,
      loginUsecase: loginUsecase);
  late final IsSignedIn isSignedIn = IsSignedIn(localRepository);
  late final LoginUsecase loginUsecase =
      LoginUsecase(localRepository: localRepository);
  late final ILocalRepository localRepository =
      LocalRepository(localDataSource: localDataSource);

  late final ILocalDataSource localDataSource =
      LocalDataSource(authentication: localAuth, secureStorage: secureStorage);
  late final AppRouter appRouter = AppRouter();
  late final LocalAuthentication localAuth = LocalAuthentication();
  late final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
}
