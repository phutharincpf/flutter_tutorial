part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const initial        = _Paths.initial;
  static const main           = _Paths.splashScreen;

  // auth
  static const login          = _Paths.login;
  static const register       = _Paths.register;
  static const logout         = _Paths.logout;

  // basic
  static const home           = _Paths.home;
  static const cart           = _Paths.cart;
  static const payment        = _Paths.payment;
  static const succeed        = _Paths.succeed;
}

abstract class _Paths {
  static const initial          = '/initial';
  static const splashScreen     = '/start';

  // auth
  static const login            = '/login';
  static const register         = '/register';
  static const logout           = '/logout';

  // basic
  static const home             = '/home';
  static const cart             = '/cart';
  static const payment          = '/payment';
  static const succeed          = '/succeed';
}
