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
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 5.5,
                offset: const Offset(0,7),
              ),
            ],
          ),
          margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.55,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          FittedBox(
                          child: Text(
                            schoolName!,
                            style: const TextStyle(fontSize: 30,),
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
                                  schoolLocation!,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.align_vertical_bottom_sharp,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  Text(schoolStudyLevel!),
                                ],
                              ),

                            ],
                          ),],
                      ),
                    ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,

                        child: Center(
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('Images/' +
                                schoolImage.toString() +
                                '.png'),
                          ),
                        ),
                      ),

                    ],
                  )),
            ],
          ),
        ),
        FittedBox(
          child: Container(
            width: MediaQuery.of(context).size.width*.16,
            padding:const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular((MediaQuery.of(context).size.height * MediaQuery.of(context).size.width)*0.0025),
            ),
            child: Center(
              child: Row(
                children: [
                  Text(schoolRate!,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  ),
                  const Icon(Icons.star,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
