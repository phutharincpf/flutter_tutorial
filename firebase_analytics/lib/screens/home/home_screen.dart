import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('HomeScreen...'),
      ),
    );
  }
}
