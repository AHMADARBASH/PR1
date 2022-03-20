import 'package:flutter/material.dart';

class AdminInstructionPage extends StatelessWidget {
  static const String routename = '/AdminInstructionPage';
  const AdminInstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Instructions'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '''- press on Manage Users to go to user management page.

- use add user button to add a new user into app.

- long press on user item to delete it.

(note): admin user can't be deleted

all mentioned instruction are used for school management 
''',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
