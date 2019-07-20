import 'package:flutter/material.dart';
import 'package:ieee_sate/Home/Drawer.dart';
class Users extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'User Page',
      theme: new ThemeData(
        fontFamily: ("Archivo_Narrow"),
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.black87,
      ),

      home: new UsersStatefulW(),
    );
  }
}
class UsersStatefulW extends StatefulWidget{
  @override
  _Users createState() => new _Users();
}
class _Users extends State<UsersStatefulW>{

  //String googleMapsApiKey = 'AIzaSyCyQkBfGuJwUqz2dJnEa99hDvOTZ87D2pw';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Users',
          style: new TextStyle(
              fontFamily: 'Julius_Sans_One'),
        ),
        centerTitle: true,

      ),
      drawer: DrawerCard(),
      body: Container(
        child: Center(
          child: RaisedButton(
            //onPressed: () {
            //},
            child: Text('User Page'),
          ),
        ),
      ),

    );
  }


}