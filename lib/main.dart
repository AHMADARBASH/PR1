import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pr1/Screens/appScreens/about_the_app_page.dart';
import 'package:pr1/Screens/appScreens/admin_instruction_page.dart';
import 'package:pr1/Screens/appScreens/advanced_search_page.dart';
import 'package:pr1/Screens/appScreens/reset_password.dart';
import 'package:pr1/Screens/appScreens/search_page.dart';
import 'package:pr1/Screens/schoolScreens/add_school_page.dart';
import 'package:pr1/Screens/userScreens/add_user_page.dart';
import 'package:pr1/Screens/appScreens/login_page.dart';
import 'package:pr1/Screens/appScreens/main_page_admin.dart';
import 'package:pr1/Screens/appScreens/main_page_user.dart';
import 'package:pr1/Screens/appScreens/signup_page.dart';
import 'package:pr1/Screens/appScreens/spalsh_screen.dart';
import 'package:pr1/Screens/userScreens/users_page_accouts.dart';
import 'package:pr1/providers/users_provider.dart';
import 'package:pr1/Screens/schoolScreens/single_school_detail.dart';
import 'package:provider/provider.dart';
import './providers/schools_provider.dart';
import 'Screens/schoolScreens/schools_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final routestable = {
    LoginPage.routename: (ctx) => const LoginPage(),
    MainPage.routename: (ctx) => const MainPage(),
    MainPageUser.routename: (ctx) => const MainPageUser(),
    SignUpPage.routename: (ctx) => const SignUpPage(),
    UsersScreen.routename: (ctx) => const UsersScreen(),
    AddUserPage.routename: (ctx) => const AddUserPage(),
    SchoolsScreen.routename: (ctx) => const SchoolsScreen(),
    AddSchoolScreen.routename: (ctx) => const AddSchoolScreen(),
    AdminInstructionPage.routename: (ctx) => const AdminInstructionPage(),
    AboutTheApp.routename: (ctx) => const AboutTheApp(),
    SearchPage.routename: (ctx) => const SearchPage(),
    AdvancedSearchPage.routename: (ctx) => const AdvancedSearchPage(),
    ResetPasswordPage.routename: (ctx) => const ResetPasswordPage(),
    SingleSchoolDetail.routeanme: (ctx) => const SingleSchoolDetail()
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
            nextScreen: const LoginPage(),
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
