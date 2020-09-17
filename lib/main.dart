import 'package:covid_19_tracker/pages/homepage.dart';
import 'package:covid_19_tracker/pages/mybottomnav.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 Tracker',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

