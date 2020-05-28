import 'dart:convert';

import 'package:covid_19_tracker/pages/countrypage.dart';
import 'package:covid_19_tracker/pages/countrywise.dart';
import 'package:covid_19_tracker/pages/totalcases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19_tracker/pages/totalcases.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_19_tracker/pages/nepal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  navigateToWHO(url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      Text('Link is not Working $url');
    }
  }

  final String url = "https://corona.lmao.ninja/v2/all";

  Future<TotalCases> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.statusCode == 200) {
      final convertDataJSON = jsonDecode(response.body);
      return TotalCases.fromJson(convertDataJSON);
    } else {
      throw Exception('Reload Please');
    }
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  navigateToCountryWise() async{
    await Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
  }

  navigateToNepalCase() async{
    await Navigator.push(context, MaterialPageRoute(builder: (context)=>Nepal()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID-19 Tracker',
          style: TextStyle(fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Stay Safe',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 40.0)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 25.0)),
                    Text('Symptoms',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/fever.png"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                Text("Headache",style: TextStyle(fontWeight: FontWeight.bold), )

                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/dry.jpg"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                Text("Dry Throat",style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/breath.jpg"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                Text("Breathing",style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Padding(padding: EdgeInsets.only(top: 25.0),),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 25.0)),
                    Text('Prevention',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/hand.png"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                Text("Clean Hand",style: TextStyle(fontWeight: FontWeight.bold), )

                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/safe.jpg"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                Text("Safe Distance",style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/mask.png"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                Text("Cover Face",style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Padding(padding: EdgeInsets.only(top: 25.0),),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 25.0)),
                    Text('WorldWide Statistics',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Container(
                  child: Card(
                    color: Colors.white54,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Total Cases",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text(
                            "Deaths",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text(
                            "Recovered",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                FutureBuilder<TotalCases>(
                  future: getJsonData(),
                  // ignore: missing_return
                  builder: (BuildContext context, Snapshot) {
                    if (Snapshot.hasData) {
                      final covid = Snapshot.data;
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          ),
                          Card(
                            color: Colors.white54,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "${covid.cases}",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${covid.deaths}",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${covid.recovered}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    } else if (Snapshot.hasError) {
                      return  Text(Snapshot.error.toString());
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Padding(padding: EdgeInsets.only(top:15.0),),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/nepal.png"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                OutlineButton(
                                  onPressed: ()=>navigateToNepalCase(),
                                  child: Text('Nepal Statisics',style: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),),
                                )

                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/globe.png"),height: 90,width: 90,),
                                Padding(padding: EdgeInsets.all(10.0),),
                                OutlineButton(
                                  onPressed: ()=>navigateToCountryWise(),
                                  child: Text('CountryWise Statisics',style: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),),
                                )

                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:15.0),),
                Card(
                  child: Container(
                    padding: EdgeInsets.only(left:5.0,right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/inq.jpg"),height: 90,width: 90,),
                        Padding(padding: EdgeInsets.all(10.0),),
                        OutlineButton(
                          onPressed: ()=>navigateToWHO("https://www.who.int/health-topics/coronavirus#tab=tab_1"),
                          child: Text('Know More',style: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
