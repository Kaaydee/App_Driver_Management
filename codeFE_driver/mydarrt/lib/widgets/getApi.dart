import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/driver.dart';


void main() {
  runApp(MaterialApp(
      title: "book_my_seat example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Container()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Driver List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Drivers> futureDrivers;

  @override
  void initState() {
    super.initState();
    futureDrivers = fetchDrivers();
  }

  Future<Drivers> fetchDrivers() async {
    final response = await http.get(ApiUrls().apiTripsList);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Drivers drivers = Drivers.fromJson(json);
      return drivers;
    } else {
      throw Exception('Failed to load drivers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver List'),
      ),
      body: Center(
        child: FutureBuilder<Drivers>(
          future: futureDrivers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DriverList(drivers: snapshot.data!.data!);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class DriverList extends StatelessWidget {
  final List<Data> drivers;

  const DriverList({super.key, required this.drivers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drivers.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(drivers[index].name ?? ''),
          subtitle: Text(drivers[index].address ?? ''),
        );
      },
    );
  }
}
