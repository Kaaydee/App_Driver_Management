// ignore_for_file: non_constant_identifier_names
// import '../model/json/driver.dart';
import 'package:flutter/foundation.dart';

import '../model/route.dart';

import '../model/fetch.dart';

// late Future<List<Driver>> fu_drivers;
// late Future<List<Vehicle>> fu_vehicles;
late Future<List<Routes>> fu_trips;
late List<Routes> trips;
// late List<Vehicle> vehicles;
// late List<Driver> drivers;
List<String> danhsach = <String>[];

Future<List<String>> load() async {
  fu_trips = fetchRouteData('http://localhost:8082/api/route');
  trips = await fu_trips;
  for (var trip in trips) {
    if (trip.idRoute != null && !danhsach.contains(trip.idRoute)) {
      // print(trip.idRoute);
      danhsach.add(trip.idRoute!);
    }
  }
  return danhsach;
}
