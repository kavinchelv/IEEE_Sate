import 'dart:async';
import 'package:flutter/material.dart';
import'package:ieee_sate/ZoneList.dart';
import 'package:ieee_sate/Styles.dart';

class Booths extends StatelessWidget{
  final zoneAJson = "json_d/zoneA.json";
  final zoneBJson = "json_d/zoneB.json";
  final zoneCJson = "json_d/zoneC.json";
  final zoneDJson = "json_d/zoneD.json";
  final zoneEJson = "json_d/zoneE.json";
  final zoneFJson = "json_d/zoneF.json";
  final zoneGJson = "json_d/zoneG.json";
  //TODO: Fix exception error calling on null, The getter 'length' was called on null.
  Widget build(BuildContext context) {
    Expanded zone(String zoneName, String zoneFile, String image){
      return Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)  =>   context == null ?Container():ZoneList(name:zoneName,file:zoneFile)),
              );
            },
          child: Container(
              decoration: BoxDecoration(
               
                color: Colors.grey[200],
                //color: const Color(0xff7c94b6),
                //Add this to DecorationImage for faded effect ---> colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain, ),
              ),
              margin: EdgeInsets.all(5.0),

                child: Center(
                  child: Text(
                    zoneName,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Source_Sans_Pro",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white10,
                    ),
                  ),
                ),
              )
          ),

      );
    }

    Expanded zoneZone (String zoneName1,  String zoneFile1,String image1, String zoneName2, String zoneFile2, String image2) {
      if(zoneFile2!=null){
        return new Expanded(
            child: Container(
                color: Colors.grey[200],
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      zone(zoneName1,zoneFile1,image1),
                      zone(zoneName2,zoneFile2,image2)
                    ]
                )
            )
        );
      }
      else{
        return new Expanded(
            child: Container(
                color: Colors.grey[200],
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      zone(zoneName1,zoneFile1,image1),
                    ]
                )
            )
        );
      }

    }
    //@override
    return new MaterialApp(
      title: 'Booth Section',
      theme: new ThemeData(
        fontFamily: ("Archivo_Narrow"),
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.grey[200],
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ZONES',
          style: new TextStyle(
            fontFamily: 'Julius_Sans_One'),
          ),
          centerTitle: true,

        ),
        body: new Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            zoneZone("Kids Zone",zoneAJson,"assets/zoneA.png","Innovation & Science Zone",zoneBJson,"assets/zoneB.png"),
            zoneZone("Technology & Robotic Zone",zoneCJson,"assets/zoneC.png","Humanitarian Zone",zoneDJson,"assets/zoneD.png"),
            zoneZone("Sports & Science Zone",zoneEJson,"assets/zoneE.png","H20 & Food Science Zone",zoneFJson,"assets/zoneF.png"),
            zoneZone("Industrial Stakeholders Zone",zoneGJson,"assets/zoneF.png",null,null,null),
          ],
        ),
      ),
    );
  }
}



