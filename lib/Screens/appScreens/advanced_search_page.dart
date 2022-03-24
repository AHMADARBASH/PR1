import 'package:flutter/material.dart';
import 'package:pr1/Screens/schoolScreens/single_school_detail.dart';
import 'package:pr1/models/school.dart';
import 'package:pr1/providers/schools_provider.dart';
import 'package:pr1/widgets/school_detail_item.dart';

class AdvancedSearchPage extends StatefulWidget {
  static const String routename = '/AdvancedSearchPage';
  const AdvancedSearchPage({Key? key}) : super(key: key);

  @override
  State<AdvancedSearchPage> createState() => _AdvancedSearchPageState();
}

class _AdvancedSearchPageState extends State<AdvancedSearchPage> {
  String locationkeyword = '';
  String city = '';
  String rate = '';
  String category = ' ';
  String studeylevel = '';
  List<String> cities = ['Damascus', 'Aleppo', 'Homs'];
  List<String> rates = ['1', '2', '3', '4', '5'];
  List<String> categories = ['Private School', 'Public School'];
  List<String> studylevels = [
    'primary education',
    'basic education',
    'High School'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Search'),
        ),
        backgroundColor: Colors.blue[50],
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: TextField(
                          onChanged: (value) {
                            if (value.isEmpty) {
                              locationkeyword = '';
                              setState(() {});
                            } else {
                              locationkeyword = value;
                              setState(() {});
                            }
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Location',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: DropdownButtonFormField(
                          hint: const Text('City'),
                          items: cities
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          onChanged: (value) {
                            city = value.toString();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: DropdownButtonFormField(
                          hint: const Text('Rate'),
                          items: rates
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          onChanged: (value) {
                            rate = value.toString();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: DropdownButtonFormField(
                          hint: const Text('School Category'),
                          items: categories
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          onChanged: (value) {
                            category = value.toString();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: DropdownButtonFormField(
                          hint: const Text('Study Level'),
                          items: studylevels
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          onChanged: (value) {
                            studeylevel = value.toString();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 5,
              child: FutureBuilder(
                  future: SchoolProvider.advancedsearchSchool(
                      locationkeyword, city, rate, category, studeylevel),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data as List<School>;
                      if (data.isNotEmpty) {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              return Card(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        SingleSchoolDetail.routeanme,
                                        arguments: data[i]);
                                  },
                                  child: SchoolDetailItem(
                                    schoolName: data[i].name,
                                    schoolLocation: data[i].location,
                                    schoolStudyLevel: data[i].studylevel,
                                    schoolRate: data[i].rate,
                                    schoolCity: data[i].city,
                                    schoolCategory: data[i].category,
                                    schoolImage: data[i].image,
                                  ),
                                ),
                              );
                            });
                      } else {
                        ListView.builder(itemBuilder: (context, index) {
                          return const Center(
                            child: Text('no data found'),
                          );
                        });
                      }
                    }
                    return const Center(
                      child: Text('Please choose Seach Criteria'),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
