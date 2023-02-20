// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i7;

import '../../../feature/auth/domain/usecase/log_in_by_biometrics.dart' as _i8;
import '../../../feature/auth/presentation/screens/auth_screen/ui/auth_screen.dart'
    as _i4;
import '../../../feature/auth/presentation/screens/auth_screen/ui/auth_splash_screen.dart'
    as _i2;
import '../../../feature/auth/presentation/screens/auth_screen/ui/registration_screen.dart'
    as _i5;
import '../../../feature/auth/presentation/screens/splash_screen/ui/start_app_splash_screen.dart'
    as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartAppSplashRoute.name: (routeData) {
      final args = routeData.argsAs<StartAppSplashRouteArgs>(
          orElse: () => const StartAppSplashRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.StartAppSplashScreen(key: args.key),
      );
    },
    SplashRouter.name: (routeData) {
      final args = routeData.argsAs<SplashRouterArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.AuthSplashScreen(
          key: args.key,
          loginUsecase: args.loginUsecase,
        ),
      );
    },
    AuthRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i4.AuthScreen()),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegistrationScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          StartAppSplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          SplashRouter.name,
          path: 'authSplash',
        ),
        _i6.RouteConfig(
          AuthRouter.name,
          path: '/auth',
          children: [
            _i6.RouteConfig(
              AuthRoute.name,
              path: 'signIn',
              parent: AuthRouter.name,
            ),
            _i6.RouteConfig(
              RegistrationRoute.name,
              path: 'signUp',
              parent: AuthRouter.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.StartAppSplashScreen]
class StartAppSplashRoute extends _i6.PageRouteInfo<StartAppSplashRouteArgs> {
  StartAppSplashRoute({_i7.Key? key})
      : super(
          StartAppSplashRoute.name,
          path: '/',
          args: StartAppSplashRouteArgs(key: key),
        );

  static const String name = 'StartAppSplashRoute';
}

class StartAppSplashRouteArgs {
  const StartAppSplashRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'StartAppSplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AuthSplashScreen]
class SplashRouter extends _i6.PageRouteInfo<SplashRouterArgs> {
  SplashRouter({
    _i7.Key? key,
    required _i8.LoginUsecase loginUsecase,
  }) : super(
          SplashRouter.name,
          path: 'authSplash',
          args: SplashRouterArgs(
            key: key,
            loginUsecase: loginUsecase,
          ),
        );

  static const String name = 'SplashRouter';
}

class SplashRouterArgs {
  const SplashRouterArgs({
    this.key,
    required this.loginUsecase,
  });

  final _i7.Key? key;

  final _i8.LoginUsecase loginUsecase;

  @override
  String toString() {
    return 'SplashRouterArgs{key: $key, loginUsecase: $loginUsecase}';
  }
}

/// generated route for
/// [_i3.EmptyRouterScreen]
class AuthRouter extends _i6.PageRouteInfo<void> {
  const AuthRouter({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i4.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'signIn',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i5.RegistrationScreen]
class RegistrationRoute extends _i6.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'signUp',
        );

  static const String name = 'RegistrationRoute';
}
