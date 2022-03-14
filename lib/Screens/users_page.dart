import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:flutter/services.dart';
import 'package:pr1/Screens/signup_page.dart';
import 'package:pr1/models/database_helper.dart';
import 'package:pr1/models/user.dart';
import 'package:pr1/providers/users_provider.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);
  static const String routename = '/UsersScreen';

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  void deleteUser(data) {
    DBHelper.deleteUser('Users', data);
  }

  showAlertDialog(BuildContext context, data) {
    // set up the buttons
    Widget yesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        deleteUser(data);
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(
        "Delete User",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: const Text("Are you sure you want to delete this user?"),
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
                duration: const Duration(seconds: 1),
                cycles: 0,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_reaction_sharp),
        onPressed: () {
          Navigator.of(context).pushNamed(SignUpPage.routename);
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: Provider.of<UserProvider>(context, listen: false)
                  .fetchUsers(),
              builder: (ctxt, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<UserProvider>(
                      child: const Center(
                        child: Text('there is no users'),
                      ),
                      builder: (ctx, value, ch) => value.items.isEmpty
                          ? ch!
                          : ListView.builder(
                              itemCount: value.items.length,
                              itemBuilder: (ctx, i) => InkWell(
                                    onLongPress: () {
                                      showAlertDialog(
                                          context, value.items[i].username);
                                      setState(() {});
                                    },
                                    child: Card(
                                      child: ListTile(
                                        title: Text(value.items[i].username!),
                                      ),
                                    ),
                                  )),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
