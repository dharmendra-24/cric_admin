import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddMatch.dart';
import 'package:flutter_application_1/Addteam.dart';
import 'package:flutter_application_1/Login/loginscreen.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/signup/signup.dart';

import 'package:flutter_application_1/matchinformation.dart';
import 'package:flutter_application_1/matchlist.dart';

import 'package:flutter_application_1/sidebar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await NotificationService.initialize();
  // FirebaseFirestore _firestore = await FirebaseFirestore.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen(),
    );
  }
}
