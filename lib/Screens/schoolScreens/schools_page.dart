import 'package:flutter/material.dart';
import 'package:pr1/Screens/schoolScreens/add_school_page.dart';
import 'package:provider/provider.dart';
import '../../providers/schools_provider.dart';
import '../../widgets/school_detail_item.dart';
import 'package:animator/animator.dart';

class SchoolsScreen extends StatelessWidget {
  static const String routename = '/SchoolsScreen';
  const SchoolsScreen({Key? key}) : super(key: key);
  showAlertDialog(BuildContext context, data) {
    // set up the buttons
    Widget yesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        Provider.of<SchoolProvider>(context, listen: false).deleteSchool(data);
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(
        "Delete School",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: const Text("Are you sure you want to delete this school?"),
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('add school'),
          onPressed: () {
            Navigator.of(context).pushNamed(AddSchoolScreen.routename);
          },
        ),
        appBar: AppBar(
          title: const Text('Schools List'),
        ),
        body: FutureBuilder(
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
                          itemBuilder: (ctx, i) => Card(
                                child: InkWell(
                                  onLongPress: () {
                                    showAlertDialog(context, value.items[i]);
                                  },
                                  child: SchoolDetailItem(
                                    schoolName: value.items[i].name,
                                    schoolLocation: value.items[i].location,
                                    schoolStudyLevel: value.items[i].studylevel,
                                    schoolRate: value.items[i].rate,
                                  ),
                                ),
                              )

                          // Card(
                          //   child: ListTile(
                          //     leading: Column(
                          //       children: [
                          //         CircleAvatar(
                          //           radius: 20,
                          //           backgroundColor:
                          //               Theme.of(context).colorScheme.primary,
                          //           child: Text(
                          //             value.items[i].rate!.toString() + '/5',
                          //             style:
                          //                 const TextStyle(color: Colors.white),
                          //           ),
                          //         ),
                          //         Text(
                          //           'Rate',
                          //           style: TextStyle(color: Colors.blue[800]),
                          //         )
                          //       ],
                          //     ),
                          //     title: Text(
                          //       value.items[i].name!,
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     ),
                          //     subtitle: Text(value.items[i].location! +
                          //         '\n' +
                          //         value.items[i].studylevel!),
                          //   ),
                          // ),
                          ),
                ),
        ),
      ),
    );
  }
}
