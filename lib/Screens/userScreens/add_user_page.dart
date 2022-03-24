import 'package:flutter/material.dart';
import 'package:pr1/providers/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/database_helper.dart';

class AddUserPage extends StatefulWidget {
  static const String routename = '/addUser';

  const AddUserPage({Key? key}) : super(key: key);
  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  TextEditingController confirmPasswordctrl = TextEditingController();

  Future<bool> signUp() async {
    if (passwordctrl.text != confirmPasswordctrl.text) {
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
                'Username': usernamectrl.text.toLowerCase(),
                'Password': passwordctrl.text
              },
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((value) => result = value);
      if (result != 0) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('new user added'),
          action: SnackBarAction(
              label: 'Dissmiss',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }),
        ));
        return true;
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('add new user failed'),
            action: SnackBarAction(
                label: 'Dissmiss',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                })));
        return false;
      }
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(
        "Cancel",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: const Text("Would you like to Cancel Sign Up?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserProvider>(context).items;
    var contain =
        users.where((element) => element.username == usernamectrl.text);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Add New User'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text(
                'Please enter User informations',
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
                      controller: usernamectrl,
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
                        usernamectrl.text = value.toString();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: passwordctrl,
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
                        passwordctrl.text = value.toString();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: confirmPasswordctrl,
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
                        confirmPasswordctrl.text = value.toString();
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
              child: InkWell(
                onTap: () {
                  if (usernamectrl.text.toLowerCase() == 'admin') {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('admin user can\'t be added'),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ));
                  } else if (usernamectrl.text.isEmpty) {
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
                          'User Already exist try another Credentials '),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ));
                  } else {
                    signUp().then((value) => null);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.center,
                  child: Text(
                    'Add New User',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 28),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
