import 'package:flutter/material.dart';
import 'package:pr1/models/school.dart';
import 'package:pr1/widgets/school_detail_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleSchoolDetail extends StatelessWidget {
  static const routeanme = '/SingleSchoolDetail';
  const SingleSchoolDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routedSchool = ModalRoute.of(context)!.settings.arguments as School;
    void checkLocation() {
      if (routedSchool.geoLocation == null) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('No Location available for this school'),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      } else {
        launch(routedSchool.geoLocation.toString());
      }
    }

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(routedSchool.name!),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: SchoolDetailItem(
                schoolCategory: routedSchool.category,
                schoolCity: routedSchool.city,
                schoolLocation: routedSchool.location,
                schoolName: routedSchool.name,
                schoolRate: routedSchool.rate,
                schoolStudyLevel: routedSchool.studylevel,
                schoolImage: routedSchool.image,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Card(
                      child: routedSchool.image != null
                          ? Image(
                              image: AssetImage('Images/' +
                                  routedSchool.image.toString() +
                                  '.png'),
                            )
                          : Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.location_disabled_sharp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 300,
                                  ),
                                  const Text(
                                      'No Image Available for this school'),
                                ],
                              ),
                            )),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Center(
              child: ElevatedButton(
                child: const Text(
                  'Check School Location in google maps',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  checkLocation();
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
