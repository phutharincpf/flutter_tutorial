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
  static const landing        = _Paths.landing;
  static const home           = _Paths.home;
  static const cart           = _Paths.cart;
  static const payment        = _Paths.payment;
  static const paymentDone    = _Paths.paymentDone;

  static const errorDevice    = _Paths.errorDevice;

  // DataMaster
  static const syncDataMaster = _Paths.syncDataMaster;

  static const orderCancel    = _Paths.orderCancel;
  static const reportPricing  = _Paths.reportPricing;
}

abstract class _Paths {
  static const initial          = '/initial';
  static const splashScreen     = '/start';

  // auth
  static const login            = '/login';
  static const register         = '/register';
  static const logout           = '/logout';

  // error
  static const errorDevice      = '/error/device';

  // basic
  static const landing          = '/landing';
  static const home             = '/home';
  static const cart             = '/cart';
  static const payment          = '/payment';
  static const paymentDone      = '/payment/done';

  // menu
  static const syncDataMaster   = '/master/sync';
  static const orderCancel      = '/order/cancel';

  // report
  static const reportPricing      = '/report/pricing';
}
