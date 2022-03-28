import 'package:flutter/material.dart';
import 'package:pr1/Screens/appScreens/about_the_app_page.dart';
import 'package:pr1/Screens/appScreens/advanced_search_page.dart';
import 'package:pr1/Screens/appScreens/login_page.dart';
import 'package:pr1/Screens/appScreens/search_page.dart';
import 'package:pr1/models/user.dart';
import 'package:animator/animator.dart';
import 'package:pr1/providers/schools_provider.dart';
import 'package:pr1/Screens/schoolScreens/single_school_detail.dart';
import 'package:pr1/widgets/simple_school_detail.dart';
import 'package:provider/provider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../schoolScreens/single_school_detail.dart';

class MainPageUser extends StatefulWidget {
  static const String routename = '/MainPageUser';

  const MainPageUser({Key? key}) : super(key: key);

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

  int selectedIndex = 0;
  @override
  build(context) {
    final routeargument = ModalRoute.of(context)!.settings.arguments as User;
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

    List<Widget> body = [
      Column(
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
                          : ListView.builder(
                              itemCount: value.items.length,
                              itemBuilder: (ctx, i) => InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          SingleSchoolDetail.routeanme,
                                          arguments: value.items[i]);
                                    },
                                    child: SimpleSchoolDetail(
                                      schoolImage: value.items[i].image,
                                      schoolStudyLevel:
                                          value.items[i].studylevel,
                                      schoolRate: value.items[i].rate,
                                      schoolLocation: value.items[i].location,
                                      schoolName: value.items[i].name,
                                      schoolCity: value.items[i].city,
                                      schoolCategory: value.items[i].category,
                                      geolocation: value.items[i].geoLocation,
                                    ),
                                  )),
                    ),
            ),
          ),
        ],
      ),
      const AboutTheApp(),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .35,
              child: const Center(
                child: Text(
                  'select your search type',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            FittedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SearchPage.routename);
                },
                child: const Text(
                  '    basic search    ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            FittedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AdvancedSearchPage.routename);
                },
                child: const Text(
                  'Advanced Search',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return routeargument.username != 'Guest'
        ? SafeArea(
            child: Scaffold(
            backgroundColor: Colors.blue[50],
            key: _scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              ),
              backgroundColor: Colors.blue,
              title: const Center(
                child: Text('SMA'),
              ),
            ),
            drawer: Drawer(
              child: draweritems,
            ),
            body: body[selectedIndex],
            bottomNavigationBar: WaterDropNavBar(
              backgroundColor: Colors.white,
              waterDropColor: Colors.blue,
              inactiveIconColor: Colors.blue,
              onItemSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedIndex: selectedIndex,
              barItems: [
                BarItem(
                  filledIcon: Icons.home,
                  outlinedIcon: Icons.home_outlined,
                ),
                BarItem(
                  filledIcon: Icons.info,
                  outlinedIcon: Icons.info_outline_rounded,
                ),
                BarItem(
                  filledIcon: Icons.saved_search,
                  outlinedIcon: Icons.search,
                ),
              ],
            ),
          ))
        : SafeArea(
            child: Scaffold(
            drawer: Drawer(
              child: draweritems,
            ),
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              title: const Text('Guest User'),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Please Login to use Search Feature'),
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
                                              child: SimpleSchoolDetail(
                                                schoolName: e.name,
                                                schoolLocation: e.location,
                                                schoolStudyLevel: e.studylevel,
                                                schoolRate: e.rate,
                                                schoolCity: e.city,
                                                schoolCategory: e.category,
                                              ),
                                            ))
                                        .toList()
                                        .sublist(0, 3),
                                  )),
                  ),
                ),
              ],
            ),
          ));
  }
}
