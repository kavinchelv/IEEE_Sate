import 'package:flutter/material.dart';
import 'package:ieee_sate/day.dart' as day;

class Schedule extends StatelessWidget{


  final saturdayDate = "4th August 2018";//useless
  final sundayDate = "5th August 2018";//useless
  final saturdayJson= "json_d/saturdayschedule.json";
  final sundayJson = "json_d/sundayschedule.json";

  @override
  Widget build(BuildContext context) {
    Expanded scheduleButtons(String label, String satd, String satf, String sund, String sunf){
      return new Expanded(
        flex: 1,
        child: new Container(
          color: Colors.white,
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
            child: new RaisedButton(
              color: Colors.lightBlue[700],

              child: new Text(label,
                textScaleFactor: 3.0,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,

                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleScreen(satDate: satd,satFile: satf ,sunDate: sund ,sunFile: sunf)),
                );
              },
            ),
          ),
        ),
      );
    }
    return MaterialApp(
      theme: new ThemeData(
        fontFamily: ("Archivo_Narrow"),
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.black87,
      ),
      home: new Scaffold(

        appBar: new AppBar(
          title: new Text("SCHEDULE",
            style: new TextStyle(
                fontFamily: 'Julius_Sans_One'),
          ),
          centerTitle: true,
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            scheduleButtons("Library",saturdayDate,saturdayJson,sundayDate,sundayJson),
            scheduleButtons("Outdoor",saturdayDate,saturdayJson,sundayDate,sundayJson),
            scheduleButtons("Pending",saturdayDate,saturdayJson,sundayDate,sundayJson),
            scheduleButtons("Pending",saturdayDate,saturdayJson,sundayDate,sundayJson),
            scheduleButtons("Pending",saturdayDate,saturdayJson,sundayDate,sundayJson),
          ],
        ),
      ),
    );
  }

}


class ScheduleScreen extends StatelessWidget {
  ScheduleScreen ({Key key, this.satDate, this.sunDate,this.satFile, this.sunFile}) : super(key:key);
  final String satDate, sunDate, satFile,sunFile;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(

            bottom: new TabBar(
              tabs: [
                new Tab(text: '  SATURDAY\n   4th August 2018'),
                new Tab(text: '  SUNDAY\n   5th August 2018'),
              ],
            ),
            elevation: 0.0,
            centerTitle: true,
            title: new Text('SCHEDULE'),

          ),
          body: new TabBarView(
            children: [
              new day.Day(date: satDate,jsonFile: satFile),
              new day.Day(date: sunDate,jsonFile: sunFile),
              //new saturday.Saturday(),
              //new sunday.Sunday(),
            ],
          ),
        ),
      ),
    );
    /*
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(

            bottom: new TabBar(
              tabs: [
                new Tab(text: 'SATURDAY'),
                new Tab(text: 'SUNDAY'),
              ],
            ),
            elevation: 0.0,
            centerTitle: true,
            title: new Text('SCHEDULE'),

          ),
          body: new TabBarView(
            children: [
              new day.Day(date: satDate,jsonFile: satFile),
              new day.Day(date: sunDate,jsonFile: sunFile),
              //new saturday.Saturday(),
              //new sunday.Sunday(),
            ],
          ),
        ),
      ),
    );
    */
  }
}
/* OLD CODE
class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(

            bottom: new TabBar(
              tabs: [
                new Tab(text: 'SATURDAY'),
                new Tab(text: 'SUNDAY'),
              ],
            ),
            elevation: 0.0,
            centerTitle: true,
            title: new Text('SCHEDULE'),
          ),
          body: new TabBarView(
            children: [
              new saturday.Saturday(),
              new sunday.Sunday(),
            ],
          ),
        ),
      ),
    );
  }
}

*/