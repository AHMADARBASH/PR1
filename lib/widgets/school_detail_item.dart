import 'package:flutter/material.dart';

class SchoolDetailItem extends StatelessWidget {
  final schoolName;
  final schoolLocation;
  final schoolStudyLevel;
  final schoolRate;
  const SchoolDetailItem(
      {Key? key,
      required this.schoolName,
      required this.schoolLocation,
      required this.schoolStudyLevel,
      required this.schoolRate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
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
                    Text(
                      schoolName,
                      style: const TextStyle(fontSize: 30),
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
                            schoolLocation,
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
                            Icons.account_balance_sharp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(schoolStudyLevel),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
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
                        schoolRate + '/5',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Text(
                    'School Rate',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
