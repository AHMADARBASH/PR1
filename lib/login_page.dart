import 'package:flutter/material.dart';
import 'package:pr1/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  build(context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[800],
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
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(100))),
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
                    children: const [
                      LoginForm(),
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
