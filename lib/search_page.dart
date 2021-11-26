import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  build(context) {
    Container _buildmodalbottomsheet(BuildContext context) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Search Filter',
                style: TextStyle(color: Colors.blue[800], fontSize: 30),
              ),
            ),
          ],
        ),
      );
    }

    var drawerheader = UserAccountsDrawerHeader(
      otherAccountsPicturesSize: const Size.square(40),
      otherAccountsPictures: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
              size: 30,
            ))
      ],
      accountName: const Text(
        'Guest',
        style: TextStyle(fontSize: 25),
      ),
      accountEmail: const Text(
        'Guest@sma.sy',
        style: TextStyle(fontSize: 15),
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
          leading: Icon(Icons.send),
          title: const Text('First Section'),
          onTap: () {},
        )
      ],
    );

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => _buildmodalbottomsheet(context),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)))),
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.filter_list_outlined),
      ),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const TextField(
          decoration: InputDecoration(
              hintText: 'Search', fillColor: Colors.white, filled: true),
        ),
      ),
      drawer: Drawer(
        child: draweritems,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    ));
  }
}

class List_Name extends StatelessWidget {
  var name;
  List_Name({required this.name});
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.blue[800], borderRadius: BorderRadius.circular(5)),
          child: Text(
            '$name',
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
