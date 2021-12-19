import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pr1/login_page.dart';
import 'package:pr1/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(
      home: SafeArea(
        child: AnimatedSplashScreen(
          splash: const SplashScreen(),
          nextScreen: const LoginPage(),
          animationDuration: const Duration(milliseconds: 500),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: double.infinity,
        ),
      ),
    );
  }
}
