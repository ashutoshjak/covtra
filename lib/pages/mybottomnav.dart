import 'package:covid_19_tracker/authentication/checkauth.dart';
import 'package:covid_19_tracker/pages/form.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/pages/homepage.dart';


class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex=0;
  final List<Widget>_children=[
    HomePage(),
    CheckAuth(),

  ];

  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap:  onTappedBar,

        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title:Text('Home',style: TextStyle(fontSize: 11.0),),
            //  backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dvr),
            title:Text('Tracking',style: TextStyle(fontSize: 11.0),),
            //   backgroundColor: Colors.white
          ),
        ],
      ),
    );
  }
}
