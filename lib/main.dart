import 'package:contact/modules/splash_screen.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey =GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
       debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


