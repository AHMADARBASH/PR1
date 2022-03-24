import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleSchoolDetail extends StatelessWidget {
  final String? schoolName;
  final String? schoolLocation;
  final String? schoolStudyLevel;
  final String? schoolRate;
  final String? schoolCity;
  final String? schoolCategory;
  String? geolocation;
  String? schoolImage;

  SimpleSchoolDetail(
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
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
