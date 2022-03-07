import '../models/school.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/database_helper.dart';

class SchoolProvider with ChangeNotifier {
  List<School> _items = [];

  List<School> get items {
    return [..._items];
  }
}
