import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../widgets/firstpage.dart';
import 'model/driver.dart';
import '../widgets/getApi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.blueAccent),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const firstpage();
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Future<Drivers> futureDrivers;

//   @override
//   void initState() {
//     super.initState();
//     futureDrivers = fetchDrivers();
//   }

//   Future<Drivers> fetchDrivers() async {
//     final response = await http.get(ApiUrls().apiTripsList);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> json = jsonDecode(response.body);
//       Drivers drivers = Drivers.fromJson(json);
//       return drivers;
//     } else {
//       throw Exception('Failed to load drivers');
//     }
//   }
//  Future<void> deleteDriver(String id) async {
//     final url = Uri.parse('http://localhost:8083/api/drivers/$id');

//     try {
//       final response = await http.delete(url);

//       if (response.statusCode == 200) {
//         // Xóa thành công
//         print('Driver with ID $id has been deleted successfully.');
//       } else {
//         // Xử lý lỗi nếu cần
//         print(
//             'Failed to delete driver with ID $id. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Xử lý lỗi nếu có
//       print('Error deleting driver: $e');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Driver List'),
//       ),
//       body: Center(
//         child: FutureBuilder<Drivers>(
//           future: futureDrivers,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return DriverList(drivers: snapshot.data!.data!);
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }

// class DriverList extends StatelessWidget {
//   final List<Data> drivers;

//   const DriverList({super.key, required this.drivers});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: drivers.length,
//       itemBuilder: (BuildContext context, int index) {
//         return CardBody(
//           driver_name: drivers[index].name,
//           driverid: drivers[index].id,
//           tuyen: drivers[index].routeId,
//           status: drivers[index].status,
//           handelDelete: deleteDriver(String),
//         );

//         // return ListTile(
//         //   title: Text(drivers[index].name ?? ''),
//         //   subtitle: Text(drivers[index].status ?? ''),
//         // );
//       },
//     );
//   }
// }

// // ignore: file_names

// // ignore: must_be_immutable
// class CardBody extends StatelessWidget {
//   CardBody({
//     super.key,
//     required this.driver_name,
//     required this.driverid,
//     required this.tuyen,
//     required this.status,
//     required this.handelDelete,
//   });
//   var driver_name, tuyen, driverid, status;
//   final Function handelDelete;
//   // final List<Driver> driver1 = [];
 

//   setSateDriver(var num) {
//     if (num != null) {
//       return const Text(
//         'Hoạt động',
//         style: TextStyle(
//           fontSize: 16,
//           color: Colors.green,
//         ),
//       );
//     } else {
//       return const Text(
//         'Chưa có tuyến',
//         style: TextStyle(
//           fontSize: 16,
//           color: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       width: double.infinity,
//       height: 150,
//       margin: const EdgeInsets.only(bottom: 15),
//       decoration: BoxDecoration(
//         color: const Color(0xffDFDFDF),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           elevation: 0,
//           backgroundColor: const Color.fromARGB(0, 243, 241, 241),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//             // side: BorderSide.none, // Optional: Remove border if not needed
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     driver_name,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                           handelDelete(driverid);
//                     },
//                     child: const Icon(
//                       Icons.delete_outline,
//                       color: Color(0xff4B4B4B),
//                       size: 30,
//                     ),
//                   )
//                 ],
//               ),
//               Text(
//                 'ID: $driverid ',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//               // const Text(
//               //   'Hoạt động',
//               //   style: TextStyle(
//               //     fontSize: 16,
//               //     color: Colors.green,
//               //   ),
//               // ),
//               setSateDriver(status),
//               Text(
//                 'Tuyến: $tuyen',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
