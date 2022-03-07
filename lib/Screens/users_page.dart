import 'package:flutter/material.dart';
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
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<UserProvider>(
                      child: const Center(
                        child: Text('there is no users'),
                      ),
                      builder: (context, value, ch) => value.items.isEmpty
                          ? ch!
                          : ListView.builder(
                              itemCount: value.items.length,
                              itemBuilder: (ctx, i) => InkWell(
                                    focusColor: Colors.red,
                                    onLongPress: () {
                                      DBHelper.delete(
                                          'Users', value.items[i].username);
                                      setState(() {});
                                    },
                                    child: ListTile(
                                      title: Text(value.items[i].username!),
                                      subtitle: Text(value.items[i].password!),
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
