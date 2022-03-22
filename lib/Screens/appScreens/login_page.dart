import 'package:flutter/material.dart';
import 'package:pr1/Screens/appScreens/main_page_admin.dart';
import 'package:pr1/Screens/appScreens/main_page_user.dart';
import 'package:pr1/Screens/appScreens/signup_page.dart';
import 'package:pr1/models/user.dart';
import 'package:provider/provider.dart';
import '../../providers/users_provider.dart';

class LoginPage extends StatefulWidget {
  static const String routename = '/LoginPage';
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
    final users = Provider.of<UserProvider>(context, listen: false).items;

    bool chcekAdminCredentials() {
      final adminUser = users
          .where((element) =>
              element.username!.toLowerCase() ==
                  usernamectrl.text.toLowerCase() &&
              element.password!.toLowerCase() ==
                  passwordctrl.text.toLowerCase())
          .toList();
      if (adminUser.any((element) =>
          element.username!.toLowerCase() == 'admin' &&
          adminUser.first.password == passwordctrl.text)) {
        return true;
      } else {
        return false;
      }
    }

    bool checkUserCredentials() {
      final user = users
          .where((element) =>
              element.username!.toLowerCase() ==
                  usernamectrl.text.toLowerCase() &&
              element.password!.toLowerCase() ==
                  passwordctrl.text.toLowerCase())
          .toList();
      if (user.any((element) =>
          element.username!.toLowerCase() != 'admin' &&
          element.password! == passwordctrl.text)) {
        return true;
      } else {
        return false;
      }
    }

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Stack(children: [
                Container(
                  color: Colors.white,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                          height:
                              (MediaQuery.of(context).size.height / 100) * 0.5),
                      const Text(
                        'S M A',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100))),
                ),
              ])),
          Expanded(
              flex: 2,
              child: Container(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: usernamectrl,
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                labelText: 'Username',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        3),
                            TextFormField(
                              controller: passwordctrl,
                              obscureText: true,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.lock_open_sharp,
                                  color: Colors.blue,
                                ),
                                labelText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Expanded(flex: 2, child: SizedBox()),
                                Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      onPressed: () {},
                                    ))
                              ],
                            ),
                            SizedBox(
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        5),
                            InkWell(
                              onTap: () {
                                if (checkUserCredentials()) {
                                  Navigator.of(context).pushReplacementNamed(
                                      MainPageUser.routename,
                                      arguments: User(
                                          username: usernamectrl.text,
                                          password: passwordctrl.text));
                                } else if (chcekAdminCredentials()) {
                                  Navigator.of(context).pushReplacementNamed(
                                      MainPage.routename,
                                      arguments: User(
                                          username: usernamectrl.text,
                                          password: passwordctrl.text));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: const Text(
                                              'Please Check your Credentials or login as a guest'),
                                          action: SnackBarAction(
                                            label: 'Dismiss',
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            },
                                          )));
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    (MediaQuery.of(context).size.height / 100) *
                                        2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have account?',
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              SignUpPage.routename);
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Login as',
                                    style: TextStyle(fontSize: 16)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          MainPageUser.routename,
                                          arguments: User(
                                              username: 'Guest',
                                              password: 'xxx'));
                                    },
                                    child: const Text(
                                      'Guest',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100))),
              ))
        ],
      ),
    ));
  }
}
