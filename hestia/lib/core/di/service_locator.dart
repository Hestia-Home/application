import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_smarthome/core/navigation/app_router/app_router.gr.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_smarthome/feature/auth/data/repository/local_repository.dart';
import 'package:flutter_smarthome/feature/auth/domain/repository/i_local_repository.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/database/db.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/repository/local_repository.dart';
import 'package:flutter_smarthome/feature/main/data/repository/remote_repository.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_remote_repository.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/is_signed_in_usecase.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/log_in_by_biometrics.dart';
import 'package:flutter_smarthome/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:flutter_smarthome/feature/main/presentation/mobx/main/appbar_store.dart';
import 'package:flutter_smarthome/feature/main/presentation/mobx/main/main_store.dart';
import 'package:flutter_smarthome/main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
final GetStorage _getStorage = GetStorage();
final AppRouter _appRouter = AppRouter();
final LocalAuthentication _localAuth = LocalAuthentication();

class AuthServiceLocator {
  static final i = AuthServiceLocator._();

  AuthServiceLocator._();

  late final myApp = MyApp(appRouter: _appRouter);
  late final AuthCubit authCubit =
      AuthCubit(isSignedIn: isSignedIn, loginUsecase: loginUsecase);
  late final IsSignedIn isSignedIn = IsSignedIn(localRepository);
  late final LoginUsecase loginUsecase =
      LoginUsecase(localRepository: localRepository);
  late final ILocalRepositoryAuth localRepository =
      LocalRepositoryAuth(localDataSource: localDataSource);

  late final ILocalDataSourceAuth localDataSource = LocalDataSourceAuth(
      authentication: _localAuth,
      secureStorage: _secureStorage,
      getStorage: _getStorage);
}

class MainServiceLocator {
  static final i = MainServiceLocator._();

  MainServiceLocator._();

  init() {
    final dataSource = _remoteDataSource;
  }

  HestiaDB get hestiaDb => _hestiaDB;

  late final IRemoteRepository _remoteRepository =
      RemoteRepository(_remoteDataSource);
  late final IRemoteDataSource _remoteDataSource =
      RemoteDataSource(_localDataSource);
  late final ILocalRepository _localRepository =
      LocalRepository(_localDataSource);
  late final ILocalDataSource _localDataSource =
      LocalDataSource(_secureStorage, _hestiaDB);
  late final HestiaDB _hestiaDB = HestiaDB();

  late final AppBarStore appBarStore = AppBarStore(_localRepository);

  late final MainStore mainStore = MainStore(_localRepository);
}
