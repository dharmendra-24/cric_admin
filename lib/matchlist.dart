import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/serialization.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DataTableDemo extends StatefulWidget {
  DataTableDemo();

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  String hour = "";
  String min = "";

  Future<List<User>> fetchdata() async {
    final response = await http.get(
      Uri.parse('https://cricket-api-lilac.vercel.app/api/cricket/matchs'),
      // headers: {
      //   'Access-Control-Allow-Origin':
      //       '*', // Replace with the appropriate CORS configuration
      // },
    );
    print("res$response");
    try {
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body)['data'];

        return list.map((model) => User.fromJson(model)).toList();
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      debugPrint("error:$e , ${response.body}");
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      //   title: const Text('Match List'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: fetchdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final users = snapshot.data;
              print(users);
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: DataTable(
                    columns: const [
                      // DataColumn(
                      //   label: Text(
                      //     'S.No',
                      //     style: TextStyle(
                      //       color: Colors.black87,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // DataColumn(
                      //   label: Text(
                      //     'Match No.',
                      //     style: TextStyle(
                      //       color: Colors.black87,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      DataColumn(
                        label: Text(
                          'Team One',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Vs',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Team Two',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Toss Winner',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Time',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Action',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // DataColumn(
                      //   label: Text(
                      //     'Upcoming',
                      //     style: TextStyle(
                      //       color: Colors.black87,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // DataColumn(
                      //   label: Text(
                      //     'Action',
                      //     style: TextStyle(
                      //       color: Colors.black87,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                    rows: snapshot.data!.map(
                      (user) {
                        print("user:- $user");
                        {
                          //   date: getDateMonth(),
                          //   team1: {
                          //     name: match.team1,
                          //   },
                          //   team2: {
                          //     name: match.team2,
                          //   },
                          //   tossWinner: match.tossWinner,
                          // };
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(user.team1.name),
                              ),
                              DataCell(
                                Container(
                                  width: 22,
                                  height: 22,
                                  color: Colors.red,
                                  child: const Center(
                                    child: Text(
                                      'Vs',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(user.team2.name),
                              ),
                              DataCell(
                                Text(user.tossWinner),
                              ),
                              DataCell(
                                Text(user.date),
                              ),
                              DataCell(
                                Text('hello'!),
                              ),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    color: Colors.red,
                                    onPressed: () {},
                                    icon: Icon(Icons.delete),
                                  ),
                                  IconButton(
                                      color: Colors.green,
                                      onPressed: () {},
                                      icon: Icon(Icons.edit))
                                ],
                              )),
                            ],
                          );
                        }
                      },
                    ).toList(),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
