import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SchoolDetailItem extends StatelessWidget {
  final String? schoolName;
  final String? schoolLocation;
  final String? schoolStudyLevel;
  final String? schoolRate;
  final String? schoolCity;
  final String? schoolCategory;
  String? geolocation;
  String? schoolImage;

  SchoolDetailItem(
      {Key? key,
      required this.schoolName,
      required this.schoolLocation,
      required this.schoolStudyLevel,
      required this.schoolRate,
      required this.schoolCity,
      required this.schoolCategory,
      this.geolocation,
      this.schoolImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FittedBox(
                      child: Text(
                        schoolName!,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.location_city,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            schoolCity!,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.location_on,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            schoolLocation!,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Icon(
                            Icons.align_vertical_bottom_sharp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(schoolStudyLevel!),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Icon(
                            Icons.attach_money,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(schoolCategory!),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        schoolRate! + '/5',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: FittedBox(
                        child: Text(
                          'School Rate',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 24),
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
