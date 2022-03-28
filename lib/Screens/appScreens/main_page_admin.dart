import 'package:flutter/material.dart';
import 'package:pr1/Screens/appScreens/admin_instruction_page.dart';
import 'package:pr1/Screens/appScreens/login_page.dart';
import 'package:pr1/Screens/schoolScreens/schools_page.dart';
import 'package:pr1/Screens/userScreens/users_page_accouts.dart';
import 'package:pr1/models/user.dart';
import 'package:provider/provider.dart';
import '../../providers/schools_provider.dart';
import 'package:animator/animator.dart';
import 'admin_instruction_page.dart';
import 'about_the_app_page.dart';

class MainPage extends StatelessWidget {
  static const String routename = '/MainPage_Admin';
  const MainPage({Key? key}) : super(key: key);

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
        'Logout',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: const Text("Are you sure you want to Logout?"),
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
                'Slide Down to Cancel',
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
    final userdetail = ModalRoute.of(context)!.settings.arguments as User;
    // ignore: unused_local_variable
    final schoolsData = Provider.of<SchoolProvider>(context);
    var drawer = UserAccountsDrawerHeader(
      otherAccountsPicturesSize: const Size.square(40),
      otherAccountsPictures: [
        FittedBox(
          child: InkWell(
            onTap: () {
              showAlertDialog(context);
            },
            child: Column(
              children: const [
                Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            ),
          ),
        ),
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
    var darawerItems = ListView(children: [
      drawer,
      ListTile(
        leading: Icon(
          Icons.info,
          color: Theme.of(context).colorScheme.primary,
          size: 45,
        ),
        title: const Text(
          'Admin Instruction',
          style: TextStyle(fontSize: 24),
        ),
        onTap: () =>
            Navigator.of(context).pushNamed(AdminInstructionPage.routename),
      ),
      const Divider(
        color: Colors.grey,
      ),
      ListTile(
        leading: Icon(
          Icons.info,
          color: Theme.of(context).colorScheme.primary,
          size: 45,
        ),
        title: const Text(
          'About the App',
          style: TextStyle(fontSize: 24),
        ),
        onTap: () => Navigator.of(context).pushNamed(AboutTheApp.routename),
      ),
      const Divider(
        color: Colors.grey,
      ),
    ]);

    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     DBHelper.getTables();
        //   },
        // ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[50],
        drawer: Drawer(
          child: darawerItems,
        ),
        appBar: AppBar(
          title: const Text('Admin Panel'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(UsersScreen.routename);
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Center(
                          child: Icon(
                            Icons.people,
                            size: 350,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mange Users',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 28),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SchoolsScreen.routename);
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Center(
                          child: Icon(
                            Icons.apartment_sharp,
                            size: 350,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mange Schools  ',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 28),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
