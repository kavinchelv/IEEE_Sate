import 'package:flutter/material.dart';

class ZoneDetail extends StatefulWidget{
  ZoneDetail({Key key, this.tag, this.activity, this.image, this.activityDescription, this.organizer, this.aboutOrganizer, this.logo}):super(key:key);
  final String tag;
  final String activity;
  final String image;
  final String activityDescription;
  final String organizer;
  final String aboutOrganizer;
  final List logo;
  @override
  _ZoneDetail createState() => _ZoneDetail();
}

class _ZoneDetail extends State<ZoneDetail> {

  @override
  Widget build(BuildContext context) {
    Container description (String title, String description) {
      return Container(
        padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        child: new Card(
          margin: new EdgeInsets.all(8.0),
          child: new Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0, vertical: 12.0),

            child: Column(
              children: <Widget>[
                new Text(
                  title, //title here
                  style: new TextStyle(
                      fontSize: 23.0, fontWeight: FontWeight.bold, height: 1.2),
                  textAlign: TextAlign.start,
                ),
                new RichText(
                  text: TextSpan(text: description,
                    style: new TextStyle(fontSize: 16.0, color: Colors.black54,fontFamily: "Source_Sans_Pro"),
                    //textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  Widget organization = Container(
    padding: new EdgeInsets.symmetric(horizontal: 10.0,vertical: 4.0),
    margin: EdgeInsets.only(top: 20.0),
    child: Text(
      "Organization",
      style: new TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold, height: 1.2),
      textAlign: TextAlign.start,
    ),
  );
    Container Logo(List logo){
      return Container(
          margin: EdgeInsets.only(bottom: 20.0,left: 9.0,right: 9.0),
          height: 900.0,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: logo == null ? 0 : logo.length,
              itemBuilder: (BuildContext context, int index){
                return Image.asset(logo[index]);
              }
          )
      );
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
        appBar: AppBar(
          title: Text(widget.activity),
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
                height: 240.0,
                child: new Hero(
                  tag: widget.tag,
                  child: new Material(
                    child: new InkWell(
                      child: new Image.asset(
                        widget.image, //todo image asset here
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )),
            description(widget.activity, widget.activityDescription),
            description(widget.organizer, widget.aboutOrganizer),
            organization,
            //Logo(widget.logo)
            Container(
                margin: EdgeInsets.only(bottom: 20.0,left: 0.0,right: 0.0),
                height: 100.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.logo.length == null ? 0 : widget.logo.length,
                    itemBuilder: (BuildContext context, int index){
                      return Image.asset(widget.logo[index],
                        fit: BoxFit.fitHeight,
                      );
                    }
                )
            )

          ],
        ),
      ),
    );
  }
}
