import 'package:flutter/material.dart';

class AboutTheApp extends StatelessWidget {
  static const String routename = '/abouttheAppPage';
  const AboutTheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '''School Management App
made by SVU Students:

- Ahmad Arbash
- Mohammad Obada Sharaf
- Yazan Manaa 

with kind super vision of:
Phd. Wassim Safi

copy right for SVU - S21 - PR1


''',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
