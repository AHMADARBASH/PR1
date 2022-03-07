class School {
  int? id;
  String? name;
  int? city;
  String? location;
  int? rate;
  int? category;
  int? studylevel;
  String? geoLocation;

  School(
      {this.id,
      required this.name,
      required this.city,
      required this.location,
      required this.rate,
      required this.category,
      required this.studylevel,
      this.geoLocation});

  School.fromMap(dynamic map) {
    name = map['Name'];
    city = map['City'];
    location = map['Location'];
    rate = map['Rate'];
    category = map['Category'];
    studylevel = map['Study_Level'];
    geoLocation = map['GeoLocation'];
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['Name'] = name;
    map['City'] = city;
    map['Location'] = location;
    map['Rate'] = rate;
    map['Category'] = category;
    map['Study_Level'] = studylevel;
    map['GeoLocation'] = geoLocation;
    return map;
  }
}
