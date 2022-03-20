import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pr1/Screens/appScreens/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  void _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: LoginPage(),
            duration: const Duration(milliseconds: 500),
            type: PageTransitionType.rightToLeftWithFade));
  }

  @override
  build(context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('Images/sma.png'),
        ),
      ),
    ));
  }
}
