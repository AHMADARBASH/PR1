import 'package:flutter/material.dart';
import 'package:pr1/search_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LloginStateForm createState() => LloginStateForm();
}

class LloginStateForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Colors.blue[800],
              ),
              labelText: 'Username',
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: (MediaQuery.of(context).size.height / 100) * 3),
          TextField(
            obscureText: true,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_open_sharp,
                color: Colors.blue[800],
              ),
              labelText: 'Password',
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
          SizedBox(height: (MediaQuery.of(context).size.height / 100) * 5),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: TextButton(
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
          ),
          SizedBox(height: (MediaQuery.of(context).size.height / 100) * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have account?',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue[800], fontSize: 18),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('or Login as', style: TextStyle(fontSize: 16)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  child: Text(
                    'Guest',
                    style: TextStyle(color: Colors.blue[800], fontSize: 16),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
