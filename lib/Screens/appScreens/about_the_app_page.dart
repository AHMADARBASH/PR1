import 'package:flutter/material.dart';

class AboutTheApp extends StatelessWidget {
  static const String routename = '/abouttheAppPage';
  const AboutTheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About the App'),
        ),
        body: const Padding(
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
