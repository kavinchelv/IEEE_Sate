import 'package:flutter/material.dart';
import 'package:ieee_sate/Home/Drawer.dart';
import 'package:ieee_sate/Auth/auth.dart';

class Points extends StatefulWidget{
  @override
  _Points createState() =>  _Points();
}
class _Points extends State<Points>{

  //String googleMapsApiKey = 'AIzaSyCyQkBfGuJwUqz2dJnEa99hDvOTZ87D2pw';
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Points',
            style: new TextStyle(
                fontFamily: 'Julius_Sans_One'),
          ),
          centerTitle: true,

        ),
        drawer: DrawerCard(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: CircularProgressIndicator(),
              ),
              Expanded(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),

      ),
    );
  }


}