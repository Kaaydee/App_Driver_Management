import 'route.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Routes>> fetchRouteData(String url) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<Routes> routes = parseRoutes(response.body);
    return routes;
  } else {
    print('Failed to load routes. Error: ${response.statusCode}');
  }
  return [];
}

List<Routes> parseRoutes(String responseBody) {
  final jsonData = json.decode(responseBody);
  final List<dynamic> routesData = jsonData['data'];
  List<Routes> routes = [];

  for (var routeData in routesData) {
    Routes route = Routes.fromJson(routeData);
    routes.add(route);
  }

  return routes;
}
