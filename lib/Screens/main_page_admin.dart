import 'package:flutter/material.dart';
import 'package:pr1/Screens/login_page.dart';
import 'package:pr1/Screens/users_page.dart';
import 'package:pr1/models/user.dart';
import 'package:provider/provider.dart';
import '../providers/schools_provider.dart';

class MainPage extends StatelessWidget {
  static const String routename = '/MainPage_Admin';
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userdetail = ModalRoute.of(context)!.settings.arguments as User;
    final schoolsData = Provider.of<SchoolProvider>(context);
    var drawer = UserAccountsDrawerHeader(
      otherAccountsPicturesSize: const Size.square(40),
      otherAccountsPictures: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginPage.routename);
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
              size: 30,
            ))
      ],
      accountName: Text(
        userdetail.username.toString().toLowerCase(),
        style: const TextStyle(fontSize: 25),
      ),
      accountEmail: Text(
        '${userdetail.username!.toLowerCase()}@sma.sy',
        style: const TextStyle(fontSize: 15),
      ),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.person,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
    var darawerItems = ListView(
      children: [
        drawer,
        ListTile(
          leading: const Icon(
            Icons.people,
            size: 40,
          ),
          title: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UsersScreen.routename);
              },
              child: const Text(
                'Users List',
                style: TextStyle(fontSize: 24),
              )),
          onTap: () {},
        )
      ],
    );

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(child: darawerItems),
        appBar: AppBar(
          title: const Text('Schools'),
        ),
      ),
    );
  }
}
