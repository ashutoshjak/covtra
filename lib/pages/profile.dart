import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/authentication/login.dart';
import 'package:covid_19_tracker/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  String name;
  String address;
  String email;
  @override
  void initState(){
    _loadUserData();
    super.initState();
  }
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if(user != null) {
      setState(() {
        name = user['name'];
        address = user['address'];
        email = user['email'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Profile',style: TextStyle(fontSize: 25,fontFamily: "Signatra",),),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)
                ),
              ),

              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Text('Name: $name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Address: $address',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Email: $email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 100.0,
                        height: 50.0,
                        child: RaisedButton(
                          elevation: 10,
                          onPressed: (){
                            logout();
                          },
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Text('Logout',style: TextStyle(
                              color: Colors.white,fontSize: 18
                          ),),

                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          )

        ],
      ),

    );
  }

  void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()));
    }
  }
}

