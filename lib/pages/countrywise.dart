import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; //same as http in home
import 'package:covid_19_tracker/pages/search.dart';


//this is useless not using just kept for backup

class CountryWise extends StatefulWidget {
  @override
  _CountryWiseState createState() => _CountryWiseState();
}

class _CountryWiseState extends State<CountryWise> {

  Future showcard (String nam,ind,ind1,inter,recover,death) async
  {
    await showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Country : $nam",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 15.0,),
                  Text("Total Cases : $ind",style: TextStyle(fontSize: 20,color : Colors.orange,),),
                  SizedBox(height: 10.0,),
                  Text("Today Cases : $ind1",style: TextStyle(fontSize: 20,color : Colors.pink),),
                  SizedBox(height: 10.0,),
                  Text("Today's Deaths : $inter",style: TextStyle(fontSize: 20,color : Colors.brown),),
                  SizedBox(height: 10.0,),
                  Text("Total Recoveries : $recover",style: TextStyle(fontSize: 20,color : Colors.green),),
                  SizedBox(height: 10.0,),
                  Text("Total Deaths : $death",style: TextStyle(fontSize: 20,color : Colors.red),),

                ],
              ),
            ),
          );
        }
    );
  }
  
  final String url = "https://corona.lmao.ninja/v2/countries";

  Future<List> datas;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    datas = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//          actions: <Widget>[
//            IconButton(icon: Icon(Icons.search),onPressed: (){
//              showSearch(context: context, delegate: Search(datas));
//            },)
//          ],
          title: Text(
            'CountryWise',
            style: TextStyle(fontFamily: "Signatra"),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: datas,
              // ignore: missing_return
              builder: (BuildContext context, Snapshot) {
                if (Snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0
                      ),
                      itemCount: 207,
                      itemBuilder: (BuildContext context,index)=>SizedBox(
                        height: 50,
                        width: 50,
                        child: GestureDetector(
                            onTap: ()=> showcard(
                                Snapshot.data[index]['country'].toString(),
                                Snapshot.data[index]['cases'].toString(),
                                Snapshot.data[index]['todayCases'].toString(),
                                Snapshot.data[index]['todayDeaths'].toString(),
                                Snapshot.data[index]['recovered'].toString(),
                                Snapshot.data[index]['deaths'].toString()),

                          child: Card(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(top: 10.0),),
                                    Image.network(Snapshot.data[index]['countryInfo']['flag'],height: 80.0,width: 80.0,),
                                    Text(Snapshot.data[index]['country'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  );
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        );
  }
}
