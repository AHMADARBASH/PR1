import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pr1/Screens/login_page.dart';
import 'package:pr1/Screens/main_page_admin.dart';
import 'package:pr1/Screens/search_page.dart';
import 'package:pr1/Screens/signup_page.dart';
import 'package:pr1/Screens/spalsh_screen.dart';
import 'package:pr1/Screens/users_page.dart';
import 'package:pr1/providers/users_provider.dart';
import 'package:provider/provider.dart';
import './providers/schools_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final routestable = {
    LoginPage.routename: (ctx) => const LoginPage(),
    MainPage.routename: (ctx) => MainPage(),
    SearchPage.routename: (ctx) => SearchPage(),
    SignUpPage.routename: (ctx) => SignUpPage(),
    UsersScreen.routename: (ctx) => UsersScreen(),
  };
  @override
  build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SchoolProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: AnimatedSplashScreen(
            splash: const SplashScreen(),
            nextScreen: LoginPage(),
            animationDuration: const Duration(milliseconds: 500),
            splashTransition: SplashTransition.fadeTransition,
            splashIconSize: double.infinity,
          ),
        ),
        routes: routestable,
      ),
    );
  }
}
