import 'package:analytics/bindings/all_binding.dart';
import 'package:analytics/configs/firebase_config.dart';
import 'package:analytics/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

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
  // await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
    appId: '1:448618578101:ios:0b650370bb29e29cac3efc',
    apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
    projectId: 'react-native-firebase-testing',
    messagingSenderId: '448618578101',
  );

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
