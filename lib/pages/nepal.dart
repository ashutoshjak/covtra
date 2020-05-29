import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/pages/nepalcases.dart';
import 'package:http/http.dart' as http;

class Nepal extends StatefulWidget {
  @override
  _NepalState createState() => _NepalState();
}

class _NepalState extends State<Nepal> {

  String url = "https://nepalcorona.info/api/v1/data/nepal";

  Future<NepalCases> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.statusCode == 200) {
      final convertDataJSON = jsonDecode(response.body);
      return NepalCases.fromJson(convertDataJSON);
    } else {
      throw Exception('Reload Please');
    }
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nepal Statistics',
          style: TextStyle(fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                child: Card(
                  color: Colors.white54,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Positive",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          "Negative",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          "PCR Test",    //Tested total
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
              FutureBuilder<NepalCases>(
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
                                  "${covid.tested_positive}",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${covid.tested_negative}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${covid.tested_total}",
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
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                child: Card(
                  color: Colors.white54,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Isolation",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          "Quarantied",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          "RTD Test",
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
              FutureBuilder<NepalCases>(
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
                                  "${covid.in_isolation}",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${covid.quarantined}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${covid.tested_rdt}",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
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
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                child: Card(
                  color: Colors.white54,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
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
              FutureBuilder<NepalCases>(
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
            ],
          ),
        ),


      ),

    );
  }
}
