import 'package:flutter/material.dart';
import '../../models/school.dart';
import 'package:provider/provider.dart';
import '../../providers/schools_provider.dart';

class AddSchoolScreen extends StatefulWidget {
  static const String routename = '/AddSchoolScreen';
  const AddSchoolScreen({Key? key}) : super(key: key);
  @override
  State<AddSchoolScreen> createState() => _AddSchoolScreenState();
}

class _AddSchoolScreenState extends State<AddSchoolScreen> {
  final formkey = GlobalKey<FormState>();
  final schoolNamecontroller = TextEditingController();
  final schoolCitycontroller = TextEditingController();
  final schoolLocationcontroller = TextEditingController();

  List<String> rate = ['1', '2', '3', '4', '5'];
  List<String> categories = ['Private School', 'Public School'];
  List<String> cities = ['Damascus', 'Aleppo', 'Homs'];
  List<String> studylevels = [
    'primary education',
    'basic education',
    'High School'
  ];
  var selectedRate = '1';
  var selectedCategory = 'Public School';
  var selectedstudylevel = 'primary education';
  var selectedcity = 'Damascus';
  var school = School(
      name: 'test',
      city: '',
      location: '',
      category: '',
      rate: '1',
      studylevel: '');

  @override
  Widget build(BuildContext context) {
    final scools = Provider.of<SchoolProvider>(context).items;
    final contain = scools.where((e) => e.name == schoolNamecontroller.text);
    void submitForm() {
      if (contain.isNotEmpty) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('School already exist '),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
        return;
      }
      if (!formkey.currentState!.validate()) {
        return;
      } else {
        formkey.currentState!.save();
        Provider.of<SchoolProvider>(context, listen: false)
            .addNewSchool(school);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('School Added Scussesfully'),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
        Provider.of<SchoolProvider>(context, listen: false).fetchSchools();
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Add New School'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'enter school information',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a name';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        schoolNamecontroller.text = value;
                      },
                      onSaved: (value) {
                        school = School(
                            name: value,
                            city: school.city,
                            location: school.location,
                            category: school.category,
                            rate: school.rate,
                            studylevel: school.studylevel);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a Location';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        school = School(
                            name: school.name,
                            city: school.city,
                            location: value,
                            category: school.category,
                            rate: school.rate,
                            studylevel: school.studylevel);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                'City',
                                style: TextStyle(
                                    fontSize: 28,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              hint: const Text('City'),
                              value: selectedcity,
                              items: cities
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: value.toString(),
                                      location: school.location,
                                      category: school.category,
                                      rate: school.rate,
                                      studylevel: school.studylevel);
                                  selectedcity = value.toString();
                                });
                              },
                              onSaved: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: value.toString(),
                                      location: school.location,
                                      category: school.category,
                                      rate: school.rate,
                                      studylevel: school.studylevel);
                                  selectedcity = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                'School Rate',
                                style: TextStyle(
                                    fontSize: 28,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              hint: const Text('Rate'),
                              value: selectedRate,
                              items: rate
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: school.city,
                                      location: school.location,
                                      category: school.category,
                                      rate: value.toString(),
                                      studylevel: school.studylevel);
                                  selectedRate = value.toString();
                                });
                              },
                              onSaved: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: school.city,
                                      location: school.location,
                                      category: school.category,
                                      rate: value.toString(),
                                      studylevel: school.studylevel);
                                  selectedRate = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'School Category',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              hint: const Text('Category'),
                              value: selectedCategory,
                              items: categories
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: school.city,
                                      location: school.location,
                                      category: value.toString(),
                                      rate: school.rate,
                                      studylevel: school.studylevel);
                                  selectedCategory = value.toString();
                                });
                              },
                              onSaved: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: school.city,
                                      location: school.location,
                                      category: value.toString(),
                                      rate: school.rate,
                                      studylevel: school.studylevel);
                                  selectedCategory = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Education Level',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 28),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              hint: const Text('Study Levels'),
                              value: selectedstudylevel,
                              items: studylevels
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: school.city,
                                      location: school.location,
                                      category: school.category,
                                      rate: school.rate,
                                      studylevel: value.toString());
                                  selectedstudylevel = value.toString();
                                });
                              },
                              onSaved: (value) {
                                setState(() {
                                  school = School(
                                      name: school.name,
                                      city: school.city,
                                      location: school.location,
                                      category: school.category,
                                      rate: school.rate,
                                      studylevel: value.toString());
                                  selectedstudylevel = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
              child: InkWell(
                onTap: () {
                  submitForm();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.center,
                  child: Text(
                    'Add New School',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 28),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
