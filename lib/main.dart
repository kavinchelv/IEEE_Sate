import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ieee_sate/Home.dart';
import 'package:ieee_sate/Sponsors.dart';
import 'package:ieee_sate/Booths.dart';
import 'package:ieee_sate/Schedule.dart';
import 'package:ieee_sate/Vote.dart';
import 'package:ieee_sate/Committee.dart';
import 'package:ieee_sate/Committee/Points.dart';
import 'package:ieee_sate/Committee/Members.dart';
import 'package:ieee_sate/Committee/Users.dart';
import 'package:ieee_sate/Auth/auth.dart';
import 'package:ieee_sate/Home/Drawer.dart';
void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'THE MAIN PAGE (Start)',
      theme: new ThemeData(
        fontFamily: ("Source_Sans_Pro"),
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.black87,
      ),
      home: ChangeNotifierProvider<AppState>(
          builder: (_) => AppState(),
          child: new MyHomePage(title: 'IEEE SATE' ,drawer:drawerCard )
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title, this.drawer}) : super(key: key);

  final String title;
  final Widget drawer;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int index=2;
  bool toRebuild = false;
  int checkView(bool cV){
    return index=cV?2:1;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    toRebuild=appState.getPageIndex;
    //index=checkView(cV);
    if(!cV) {

      return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: index != 0,
              child: new TickerMode(
                enabled: index == 0,
                child: new MaterialApp(home: new Booths()),
              ),
            ),
            new Offstage(
              offstage: index != 1,
              child: new TickerMode(
                enabled: index == 1,
                child: new MaterialApp(home: new Schedule()),
              ),
            ),
            new Offstage(
              offstage: index != 2,
              child: new TickerMode(
                enabled: index == 2,
                child: new MaterialApp(home: new Home(reDraw: DrawerCard())),
              ),
            ),
            new Offstage(
              offstage: index != 3,
              child: new TickerMode(
                enabled: index == 3,
                child: new MaterialApp(home: new Vote(storage: Storage(),)),
              ),
            ),
            new Offstage(
              offstage: index != 4,
              child: new TickerMode(
                enabled: index == 4,
                child: new MaterialApp(home: new Sponsors()),
              ),
            ),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue[600],
          currentIndex: index,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },

          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: const Icon(Icons.info_outline),
              title: new Text('Zones'),
            ),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.access_time),
              title: new Text('Schedule'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.event_available),
              title: new Text("Voting"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              title: new Text("Venue"),
            ),

          ],
        ),
      );
    }
    else{

      return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: index != 1,
              child: new TickerMode(
                enabled: index == 1,
                child: new MaterialApp(home: Members()),
              ),
            ),

            new Offstage(
              offstage: index != 2,
              child: new TickerMode(
                enabled: index == 2,
                child: new MaterialApp(home: Points()),
              ),
            ),
            new Offstage(
              offstage: index != 3,
              child: new TickerMode(
                enabled: index == 3,
                child: new MaterialApp(home: Users()),
              ),
            ),

          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue[600],
          currentIndex: index,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: const Icon(Icons.memory),
              title: new Text('Members'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.graphic_eq),
              title: new Text("QR Code"),
            ),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.supervisor_account),
              title: new Text('Users'),
            ),

          ],
        ),
      );
    }
  }
  // does nothing


}
