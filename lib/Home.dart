import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'package:ieee_sate/Auth/auth.dart';
import 'package:ieee_sate/Home/Drawer.dart';
// NEW HOME

class Home extends StatefulWidget {

  final DrawerCard reDraw;
  final int index;

  Home({Key key, @required this.reDraw,this.index}) : super(key: key);
  @override
  _Home createState() => _Home();
}


class _Home extends State<Home> {


  //does nothing atm
  static final TextStyle _boldStyle =  TextStyle(fontWeight: FontWeight.bold);
  static final TextStyle _greyStyle =  TextStyle(color: Colors.grey);
  static final Container _boxStyle =  Container(
    decoration: new BoxDecoration(
      color: Colors.white,),
    margin: const EdgeInsets.fromLTRB(2.0,5.0,2.0,5.0),
  );
  static final Column _colStyle = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
  );
  //does nothing atm

  //time conversion
  String timeAgo(String facebooktime){
    if((DateTime.now()).difference(DateTime.parse(facebooktime)).inSeconds==1)
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inSeconds.toString() + " second ago");
      return facebooktime;
    }
    else if((DateTime.now()).difference(DateTime.parse(facebooktime)).inSeconds<60)
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inSeconds.toString() + " seconds ago");
      return facebooktime;
    }
    else if(((DateTime.now()).difference(DateTime.parse(facebooktime)).inMinutes==1))
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inMinutes.toString() + " minute ago");
      return facebooktime;
    }
    else if(((DateTime.now()).difference(DateTime.parse(facebooktime)).inMinutes<60))
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inMinutes.toString() + " minutes ago");
      return facebooktime;
    }
    else if(((DateTime.now()).difference(DateTime.parse(facebooktime)).inHours==1))
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inHours.toString() + " hour ago");
      return facebooktime;
    }
    else if(((DateTime.now()).difference(DateTime.parse(facebooktime)).inHours<24))
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inHours.toString() + " hours ago");
      return facebooktime;
    }
    else if(((DateTime.now()).difference(DateTime.parse(facebooktime)).inDays==1))
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inDays.toString() + " day ago");
      return facebooktime;
    }
    else
    {
      facebooktime=((DateTime.now()).difference(DateTime.parse(facebooktime)).inDays.toString() + " days ago");
      return facebooktime;
    }
  }

  List new_data=[];
  String ieeelogo = "https://media.licdn.com/dms/image/C4E0BAQGoRdJYxmIDhQ/company-logo_200_200/0?e=2159024400&v=beta&t=IqfUfK7lWxXqhKyViqKk-zoGn5ddzi408ZHUKSsyaHo";
  String url = "https://graph.facebook.com/168116483254527/feed?access_token=EAAEwI6HUBS8BAJvFn9gfPAoVNb2kbAZAhh2UzHG7ZA2PteEe9SKblUyr3UhPyGF40AJKSPKNJEVDCRHQzdW0p27DLqI8qGvqtW9jZBmaLXL3X8fr7OdgQg64cCi9VxPZA74Avd3sYqxyCHZB61MvoPZBoyMeKJQBH6JOgGP64VxF4PhV9X1412&fields=id,message,full_picture,link,name,description,type,created_time,from,object_id&limit=20";

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      new_data = extractdata["data"];
      print(new_data);
    });

    return 'ok';
}

  @override
  void initState() {
    this.makeRequest();
  }
  Future reload() async{
    setState(() {
      new_data=[];
      makeRequest();
    });
    // Every listener should be canceled, the same should be done with this stream.
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: new ThemeData(
        fontFamily: ("Source_Sans_Pro"),
        backgroundColor: Colors.lightBlue[800],

      ),

      home: new Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue[800],

          child: IconButton(
            icon: Icon(Icons.refresh),
            iconSize: 35.0,
            onPressed: () {
              reload();
            },
          ),

        ),

        drawer: widget.reDraw,
        //drawer: DrawerCard(),

        body: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 50.0,

              backgroundColor: Colors.lightBlue[800],
              pinned: true,
              floating: true,
              snap:false,
              flexibleSpace: new FlexibleSpaceBar(
                centerTitle: true,
                title: Text('HOME'),
                background: new Image.network(
                    "https://img.mapado.net/2018/8/4/5b65989397b49--2fimages-2f47384870-2f228721560473-2f1-2foriginal.jpg_thumbs/480-150.jpg",
                    fit: BoxFit.fill),
              ),
            ),
            loadFeed(new_data),
            /*
            new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 9.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                          (builder, index) =>
                          facebookCard(new_data[index]["id"],new_data[index]["full_picture"],new_data[index]["message"], new_data[index]["description"],new_data[index]["created_time"],new_data[index]["from"]["name"]),
                      //old code  _items[index]
                      childCount: new_data.length), //old code _items.length
                )),
            */
            new SliverToBoxAdapter( // the end of page
                child: GestureDetector(
                  onTap: reload,
                  child: new Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    color: Colors.black,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          'End of Page',
                          style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 24.0,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),

      //home: LoadFeed(new_data),
    );
  }
  //Changes 1. container margin comment out
  Widget facebookCard(String id, String fullpic, String msg,String desc, String time, String fromIEEE) {
    if(fullpic!=null&&msg!=null){
      return new Container(
        decoration: new BoxDecoration(
          color: Colors.white,

        ),
        margin: const EdgeInsets.fromLTRB(2.0,5.0,2.0,5.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(14.0,16.0,8.0,16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                image: new NetworkImage(ieeelogo)
                            )
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                fromIEEE,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: TextStyle(fontWeight: FontWeight.bold
                                )
                                ,
                              ),
                            ],
                          ),
                          new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: new Text(
                              timeAgo(time),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),

                  new IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: null
                  )

                ],
              ),

            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,8.0),
              child: Column(
                children: <Widget>[
                  new Container(

                    child: new Image.network(
                      fullpic,
                      fit: BoxFit.contain,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                    child: new Text(
                      msg.toString(),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );
    }
    else if(fullpic!=null&&desc!=null){
      return new Container(
        decoration: new BoxDecoration(
          color: Colors.white,

        ),
        margin: const EdgeInsets.fromLTRB(2.0,5.0,2.0,5.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(14.0,16.0,8.0,16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                image: new NetworkImage(ieeelogo)
                            )
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                fromIEEE,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: new Text(
                              timeAgo(time),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  new IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: null
                  )
                ],
              ),

            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,8.0),
              child: Column(
                children: <Widget>[
                  new Container(

                    child: new Image.network(
                      fullpic,
                      fit: BoxFit.contain,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                    child: new Text(
                      desc.toString(),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );
    }
    else if(fullpic!=null&&desc==null){
      return new Container(
        decoration: new BoxDecoration(
          color: Colors.white,

        ),
        margin: const EdgeInsets.fromLTRB(2.0,5.0,2.0,5.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(14.0,16.0,8.0,16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                image: new NetworkImage(ieeelogo)
                            )
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                fromIEEE,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: new Text(
                              timeAgo(time),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  new IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: null
                  )
                ],
              ),

            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,8.0),
              child: new Container(
                child: new Image.network(
                  fullpic,
                  fit: BoxFit.contain,
                ),
              ),
            ),

          ],
        ),
      );
    }
    else{
      return new Container(

        decoration: new BoxDecoration(
          color: Colors.white,

        ),
        margin: const EdgeInsets.fromLTRB(2.0,5.0,2.0,5.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(14.0,16.0,8.0,16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                image: new NetworkImage(ieeelogo)
                            )
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                fromIEEE,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: new Text(
                              timeAgo(time),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  new IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: null
                  )
                ],
              ),

            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,12.0),
              child: new Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                  child: new Text(msg.toString())
              ),
            ),

          ],
        ),
      );
    }
  }

  Widget loadFeed(List new_data){
       if(new_data!=null){
        return SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 9.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                          (builder, index) =>
                          facebookCard(new_data[index]["id"],new_data[index]["full_picture"],new_data[index]["message"], new_data[index]["description"],new_data[index]["created_time"],new_data[index]["from"]["name"]),
                      //old code  _items[index]
                      childCount: new_data.length), //old code _items.length
                )
        );
      }
    else
    {
       return SliverPadding(
           padding: const EdgeInsets.symmetric(vertical: 9.0),
           sliver: new SliverList(
             delegate: new SliverChildBuilderDelegate(
                     (builder, index) =>
                     CircularProgressIndicator(),
                     //facebookCard('0',"https://cdn.pixabay.com/photo/2017/07/08/08/59/cat-2483826_960_720.jpg","Requires Update", "hello world",DateTime.now().toString(),"IEEE Curtin Malaysia"),
                 //old code  _items[index]
                 childCount: 1), //old code _items.length
           )
       );

    }
  }

}