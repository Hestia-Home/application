import 'package:auto_route/auto_route.dart';
import 'package:flutter_smarthome/feature/auth/presentation/screens/auth_screen/ui/auth_screen.dart';
import 'package:flutter_smarthome/feature/auth/presentation/screens/auth_screen/ui/auth_splash_screen.dart';
import 'package:flutter_smarthome/feature/auth/presentation/screens/auth_screen/ui/registration_screen.dart';
import 'package:flutter_smarthome/feature/auth/presentation/screens/splash_screen/ui/start_app_splash_screen.dart';
import 'package:auto_route/empty_router_widgets.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(path: '/', page: StartAppSplashScreen, initial: true),
  AutoRoute(name: 'SplashRouter', path: 'authSplash', page: AuthSplashScreen),
  AutoRoute(
      name: 'AuthRouter',
      path: '/auth',
      page: EmptyRouterScreen,
      children: [
        AutoRoute(path: 'signIn', page: AuthScreen),
        AutoRoute(path: 'signUp', page: RegistrationScreen)
      ])
])
class $AppRouter {}
