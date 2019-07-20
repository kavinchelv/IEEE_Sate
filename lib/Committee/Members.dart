import 'package:flutter/material.dart';
import 'package:ieee_sate/Home/Drawer.dart';
class Members extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Member Page',
      theme: new ThemeData(
        fontFamily: ("Archivo_Narrow"),
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.black87,
      ),

      home: new MembersStatefulW(),

    );
  }
}
class MembersStatefulW extends StatefulWidget{
  @override
  _Members createState() => new _Members();
}
class _Members extends State<MembersStatefulW>{

  //String googleMapsApiKey = 'AIzaSyCyQkBfGuJwUqz2dJnEa99hDvOTZ87D2pw';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Members',
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
            child: Text('Member Page'),
          ),
        ),
      ),
    );
  }


}