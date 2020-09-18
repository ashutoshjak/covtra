import 'package:covid_19_tracker/authentication/login.dart';
import 'package:covid_19_tracker/pages/form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Forms();
    } else {
      child = Login();
    }
    return Scaffold(
      body: child,
    );
  }
}