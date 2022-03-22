import 'package:flutter/material.dart';
import 'package:pr1/Screens/appScreens/about_the_app_page.dart';
import 'package:pr1/Screens/appScreens/login_page.dart';
import 'package:pr1/Screens/appScreens/search_page.dart';
import 'package:pr1/models/user.dart';
import 'package:animator/animator.dart';
import 'package:pr1/providers/schools_provider.dart';
import 'package:pr1/widgets/school_detail_item.dart';
import 'package:provider/provider.dart';

class MainPageUser extends StatefulWidget {
  static const String routename = '/MainPageUser';
  MainPageUser({Key? key}) : super(key: key);

  @override
  State<MainPageUser> createState() => _MainPageUserState();
}

class _MainPageUserState extends State<MainPageUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();

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
  build(context) {
    final routeargument = ModalRoute.of(context)!.settings.arguments as User;
    Container _buildmodalbottomsheet(BuildContext context) {
      return Container(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Search Filter',
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
            ),
          ],
        ),
      );
    }

    var drawerheader = UserAccountsDrawerHeader(
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
        routeargument.username.toString().toLowerCase(),
        style: const TextStyle(fontSize: 25),
      ),
      accountEmail: Text(
        '${routeargument.username.toString().toLowerCase()}@sma.sy',
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
    final draweritems = ListView(
      children: [
        drawerheader,
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
      ],
    );

    return routeargument.username != 'Guest'
        ? SafeArea(
            child: Scaffold(
            backgroundColor: Colors.blue[50],
            floatingActionButton: FloatingActionButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => _buildmodalbottomsheet(context),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)))),
              backgroundColor: Colors.blue,
              child: const Icon(Icons.filter_list_outlined),
            ),
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SearchPage.routename);
                  },
                )
              ],
            ),
            drawer: Drawer(
              child: draweritems,
            ),
            body: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<SchoolProvider>(context, listen: false)
                        .fetchSchools(),
                    builder: (context, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? const Center(child: CircularProgressIndicator())
                            : Consumer<SchoolProvider>(
                                child: const Center(
                                  child: Text('There is no Schools to show'),
                                ),
                                builder: (ctx, value, ch) => value.items.isEmpty
                                    ? ch!
                                    : ListView.builder(
                                        itemCount: value.items.length,
                                        itemBuilder: (ctx, i) => Card(
                                              child: SchoolDetailItem(
                                                schoolName: value.items[i].name,
                                                schoolLocation:
                                                    value.items[i].location,
                                                schoolStudyLevel:
                                                    value.items[i].studylevel,
                                                schoolRate: value.items[i].rate,
                                                schoolCity: value.items[i].city,
                                                schoolCategory:
                                                    value.items[i].category,
                                              ),
                                            )),
                              ),
                  ),
                ),
              ],
            ),
          ))
        : SafeArea(
            child: Scaffold(
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              title: const Text('Guest User'),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.filter_list),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Please Login to use Search Feautre'),
                  action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      }),
                ));
              },
            ),
            body: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<SchoolProvider>(context, listen: false)
                        .fetchSchools(),
                    builder: (context, snapshot) => snapshot.connectionState ==
                            ConnectionState.waiting
                        ? const Center(child: CircularProgressIndicator())
                        : Consumer<SchoolProvider>(
                            child: const Center(
                              child: Text('There is no Schools to show'),
                            ),
                            builder: (ctx, value, ch) => value.items.isEmpty
                                ? ch!
                                : ListView(
                                    children: value.items
                                        .map((e) => Card(
                                              child: SchoolDetailItem(
                                                schoolName: e.name,
                                                schoolLocation: e.location,
                                                schoolStudyLevel: e.studylevel,
                                                schoolRate: e.rate,
                                                schoolCity: e.city,
                                                schoolCategory: e.category,
                                              ),
                                            ))
                                        .toList(),
                                  )),
                  ),
                ),
              ],
            ),
          ));
  }
}
