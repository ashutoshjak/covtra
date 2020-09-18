import 'dart:convert';
import 'package:covid_19_tracker/network_utils/ipaddress.dart';
import 'package:covid_19_tracker/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _track_title = TextEditingController();
  final _track_description = TextEditingController();

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
            }
          )
        ],
        title: Text(
          'Form',
          style: TextStyle(fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    TextFormField(
                    controller: _track_title,
                      style: TextStyle(color: Color(0xFF000000)),
                      cursorColor: Color(0xFF9b9b9b),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.library_books,
                          color: Colors.grey,
                        ),
                        hintText: "Title",
                        hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),

                    ),
                    SizedBox(
                      height: 10.0,

                    ),
                    TextFormField(
                    controller: _track_description,
                      style: TextStyle(color: Color(0xFF000000)),
                      cursorColor: Color(0xFF9b9b9b),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: "Description",
                        hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,

                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                          child: Text('Submit',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(color: Colors.white),),
                          color: Colors.black,

                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(20.0)),
                          onPressed: (){
                            setState(() {
                              addData();
                            });
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  //==============ADD DATA fucntion

  void addData() async {

    String url = "http://${Server.ipAddress}/covid/public/api/track";
    await http
        .post(url,
        headers: {'Accept': 'application/json'},
        body: ({
          "track_title": _track_title.text,
          "track_description": _track_description.text,
        }))
        .then((response) {
      if (response.statusCode == 201) {
        success();
      } else {
        failed();
      }
    });

  }
  void success() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Submited Successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void failed() {
//    var context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Could not sent "),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}



