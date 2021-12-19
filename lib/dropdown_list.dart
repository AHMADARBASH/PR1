import 'package:flutter/material.dart';
import 'data.dart';

class Dropdownlist extends StatefulWidget {
  @override
  _Dropdownlist createState() => _Dropdownlist();
}

class _Dropdownlist extends State<Dropdownlist> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: TextStyle(color: Colors.blue[800]),
      iconEnabledColor: Colors.blue[800],
      value: studyleveldorpdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: studylevels.map((String items) {
        return DropdownMenuItem(value: items, child: Text(items));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          studyleveldorpdownvalue = newValue!;
        });
      },
    );
  }
}
