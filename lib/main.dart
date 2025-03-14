import 'package:flutter/material.dart';
import 'package:swd4_s1/bmi_screen.dart';
import 'package:swd4_s1/counter_screen.dart';
import 'package:swd4_s1/login_screen.dart';
import 'package:swd4_s1/messenger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   useMaterial3: false
      // ),
      home: BmiScreen(),
    );
  }
}


