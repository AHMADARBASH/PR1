import 'package:flutter/material.dart';
import 'package:pr1/Screens/appScreens/login_page.dart';
import 'package:pr1/providers/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/database_helper.dart';
import 'package:animator/animator.dart';

class SignUpPage extends StatefulWidget {
  static const String routename = '/SignUpPage';

  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<bool> singUp() async {
    if (password.text != confirmPassword.text) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('passwords doesn\'t match'),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ));
      return false;
    } else {
      final db = await DBHelper.database();
      // ignore: prefer_typing_uninitialized_variables
      var result;
      db
          .insert(
              'Users',
              {
                'Username': username.text.toLowerCase(),
                'Password': password.text
              },
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((value) => result = value);
      if (result != 0) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Signed Up Sucessfuly'),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPage.routename, ModalRoute.withName('/'));
        return true;
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('second snackbar'),
          action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }),
        ));
        return false;
      }
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget yesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPage.routename, (Route<dynamic> route) => false);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(
        'Cancel',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: const Text("Are you sure you want to cancel?"),
      actions: [
        yesButton,
      ],
    );

    // show the dialog
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              alert,
              Animator<double>(
                cycles: 0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOutQuad,
                tween: Tween<double>(begin: 15.0, end: 25.0),
                builder: (context, animatorState, child) => Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: animatorState.value * 5,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Text(
                'Silde Down to Cancel',
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserProvider>(context).items;
    final contain = users.where((element) => element.username == username.text);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('SignUp'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text(
                'Please enter your informations',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: username,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onSubmitted: (value) {
                        username.text = value.toString();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onSubmitted: (value) {
                        password.text = value.toString();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: confirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onSubmitted: (value) {
                        confirmPassword.text = value.toString();
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15)),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    if (username.text.toLowerCase() == 'admin') {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                            'admin already exits try another name please '),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ));
                    } else if (username.text.isEmpty) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Please Enter a User Name '),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ));
                    } else if (contain.isNotEmpty) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                            'User already exist try another credentials '),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ));
                    } else {
                      singUp().then((value) => null);
                    }
                  },
                  child: Text(
                    'SignUp with SMA',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 28),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.2,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
