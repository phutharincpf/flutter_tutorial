import 'package:firebase_analytics/bindings/all_binding.dart';
import 'package:firebase_analytics/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
  ));

  // initial
  // await Firebase.initializeApp(options: FirebaseConfig.platformOptions);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Analytics',
      getPages: AppRouter.route,
      initialRoute: AppRouter.initial,
      initialBinding: AllBinding(),
      defaultTransition: Transition.noTransition,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 18.0, height: 1),
          bodyText2: TextStyle(fontSize: 20.0, height: 1),
          button: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      // navigatorObservers: <NavigatorObserver>[observer],
    );
  }
}
