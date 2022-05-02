import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:get/get.dart';
import 'package:pos_android/bindings/all_binding.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
  ));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  if( Device.get().isAndroid ) {
    await Firebase.initializeApp();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<NavigatorObserver> navigatorObserver = [];

    if( Device.get().isAndroid ) {
      FirebaseAnalytics analytics = FirebaseAnalytics.instance;
      navigatorObserver = [FirebaseAnalyticsObserver(analytics: analytics)];
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS',
      getPages: AppPages.route,
      initialRoute: AppPages.initial,
      initialBinding: AllBinding(),
      defaultTransition: Transition.noTransition,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        textTheme: TextTheme(
          bodyText1: Styles.text,
          bodyText2: Styles.text,
          button: Styles.button,
        ),
      ),
      navigatorObservers: navigatorObserver,
    );
  }
}