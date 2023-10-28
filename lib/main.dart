import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddMatch.dart';
import 'package:flutter_application_1/Addteam.dart';
import 'package:flutter_application_1/matchinformation.dart';
import 'package:flutter_application_1/matchlist.dart';

import 'package:flutter_application_1/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MySideBar(),
    );
  }
}
