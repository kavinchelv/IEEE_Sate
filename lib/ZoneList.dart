import 'package:flutter/material.dart';
import 'package:ieee_sate/ZoneDetails.dart';
import 'dart:async';
import 'dart:convert';
class ZoneList extends StatefulWidget{
  ZoneList({Key key, this.name, this.file}):super(key:key);
  final String name;
  final String file;

  @override
  _ZoneList createState()=> new _ZoneList();
}

class _ZoneList extends State<ZoneList> {
  List data=[];

  @override
  Widget build(BuildContext context) {
    Card zoneCard (String activity, String descAct,String indexTag, String image, String org, String aboutOrg, List logo) {
      return Card(
          elevation: 1.7,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: new Hero(
                  tag: indexTag,// tag here
                  child: Material(
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (
                                  BuildContext context) => new ZoneDetail(tag: indexTag,activity: activity,image: image,aboutOrganizer: aboutOrg,organizer:org ,activityDescription: descAct,logo: logo,))),
                      child: Image.asset(
                        image,//IMAGE here
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  activity, //tag here
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],

          ));
    }
    return Theme(
      data: ThemeData(
        fontFamily: ("Archivo_Narrow"),
        //brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.black87,
      ),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.name),
        ),
        body: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString(widget.file),
            builder: (BuildContext  context, AsyncSnapshot snapshot){
              var zoneData =  jsonDecode(snapshot.data.toString());
              int dataLength = zoneData.length!=null?zoneData.length: 0;
              if(dataLength==null){
                return CircularProgressIndicator();
              }
              else if(dataLength!=null){
                return GridView.count(
                    padding: const EdgeInsets.all(1.0),
                    childAspectRatio: 0.99,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    crossAxisCount: 2,

                    // Generate 100 Widgets that display their index in the List
                    children: List.generate(dataLength, (int index) {
                      return Container(
                        child: zoneCard(zoneData[index]["activity"],zoneData[index]["activityDescription"],index.toString(),zoneData[index]["zoneImage"],zoneData[index]["organizer"],zoneData[index]["aboutOrganizer"],zoneData[index]["logo"]),
                      );
                    })
                );
              }
              else
                return CircularProgressIndicator();


            }
        )

      ),
    );
  }

}

/*
class ZoneList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget zoneCard = new Card(

        elevation: 1.7,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: new Hero(
                tag:"lol",
                child: new Material(

                  child: InkWell(
                    onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new ZoneDetail())),
                    child: Image.network("https://cdn.mos.cms.futurecdn.net/9r52PM56WnQuFzhcSDXJKj-650-80.jpg",
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                'Young Innovater Challenge',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],

        ));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Booths"),
      ),
      body: GridView.count(
          padding: const EdgeInsets.all(1.0),
          childAspectRatio: 0.99,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(1, (index) {
            return Container(
              child: zoneCard,
            );
          })
      ),
    );
  }

}

*/