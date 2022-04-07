part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const initial = _Paths.initial;
  static const main = _Paths.splashScreen;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const logout = _Paths.logout;

  // basic
  static const home = _Paths.home;
}

abstract class _Paths {
  static const initial = '/initial';
  static const splashScreen = '/';
  static const login = '/login';
  static const register = '/register';
  static const logout = '/logout';

  // basic
  static const home = '/home';
}
