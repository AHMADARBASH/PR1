import 'package:flutter/material.dart';
import 'package:pr1/models/school.dart';
import 'package:pr1/providers/schools_provider.dart';
import 'package:pr1/widgets/school_detail_item.dart';

class SearchPage extends StatefulWidget {
  static const String routename = '/SearchPage';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String keyword = 'test';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        backgroundColor: Colors.blue[50],
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      keyword = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'search',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 5,
              child: FutureBuilder(
                  future: SchoolProvider.searchSchool(keyword),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data as List<School>;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) => Card(
                          child: InkWell(
                            child: SchoolDetailItem(
                              schoolName: data[i].name,
                              schoolLocation: data[i].location,
                              schoolStudyLevel: data[i].studylevel,
                              schoolRate: data[i].rate,
                              schoolCity: data[i].city,
                              schoolCategory: data[i].category,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return ListView(
                        children: const [
                          Center(
                            child: Text('Enter keywrod to search'),
                          )
                        ],
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
