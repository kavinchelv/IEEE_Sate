import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import'package:url_launcher/url_launcher.dart';

String url = "https://goo.gl/forms/UikZ8jAvpCPzKlGF2";

String selectedUrl = "https://goo.gl/forms/OlKJ6IKt4vsgTISV2";
const kAndroidUserAgent =
    "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36";

class Vote extends StatefulWidget{
  final Storage storage;

  Vote({Key key, @required this.storage}) : super(key: key);
  @override
  _Vote createState() => _Vote();
}
class _Vote extends State<Vote>{

//UPGRADEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
  TextEditingController controller = TextEditingController();
  String state;
  String letters;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  //WEBVIEW
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  TextEditingController _urlCtrl = new TextEditingController(text: selectedUrl);
  TextEditingController _codeCtrl =
  new TextEditingController(text: "window.navigator.userAgent");
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();


  //WEBVIEW


  @override
  void initState() {
    super.initState();

    _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });
    state="a";
    if(state=="g"){
      wF();
    }
    if(state=="b"){
      wA();
    }
    if(state=="e"){
      wD();
    }
    widget.storage.readData().then((String value) {
      setState(() {
        state = value;
      });
    });
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      setState(() {
        selectedUrl="$url";
        _urlCtrl=TextEditingController(text: url);
        if(selectedUrl=="https://docs.google.com/forms/d/e/1FAIpQLSexBkWOS0PMc1PLZDCbzwPx09mKbLHNsVp5bcwTgjRQxbUBYA/viewanalytics"&&state=="b"||
            selectedUrl=="https://docs.google.com/forms/d/e/1FAIpQLSexBkWOS0PMc1PLZDCbzwPx09mKbLHNsVp5bcwTgjRQxbUBYA/viewanalytics?usp=form_confirm"&&state=="b"){
          wD();
          flutterWebviewPlugin.close();
        }
        else if(selectedUrl=="https://docs.google.com/forms/d/e/1FAIpQLSdvXru2QIZ-C77pShkBJz89iamKtBsqHla6jjE3YA5A3KFJSg/viewanalytics"&&state=="e"||
            selectedUrl=="https://docs.google.com/forms/d/e/1FAIpQLSdvXru2QIZ-C77pShkBJz89iamKtBsqHla6jjE3YA5A3KFJSg/viewanalytics?usp=form_confirm"&&state=="e"){
          wF();
          flutterWebviewPlugin.close();

        }
      });
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
  wA(){
    setState(() {
      letters = "a";
    });
    writeData3();
  }
  wB(){
    setState(() {
      letters = "b";
    });
    writeData3();
  }
  wC(){
    setState(() {
      letters = "c";
    });
    writeData3();
  }
  wD(){
    setState(() {
      letters = "d";
    });
    flutterWebviewPlugin.close();
    writeData3();
  }
  wE(){
    setState(() {
      letters = "e";
    });
    writeData3();
  }
  wF(){
    setState(() {
      letters = "f";
    });
    writeData3();
    flutterWebviewPlugin.close();
  }
  wG(){
    setState(() {
      letters = "g";
    });
    writeData3();
  }
  wH(){
    setState(() {
      letters = "h";
    });
    writeData3();
  }
  Future<File> writeData3() async {
    setState(() {
      state = letters;
      //controller.text = '';
    });

    return widget.storage.writeData(state);
  }
  Future<File> writeData() async {
    setState(() {

      state = controller.text;
      controller.text = '';
    });

    return widget.storage.writeData(state);
  }



//UPGRADEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
//END
  @override
  Widget build(BuildContext context) {
//START
//UPGRADEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
    Widget Empty = new Container();
    Empty= new Container();
    Widget NotVotedSVF = new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.black26,
        border:  Border.all( color:const Color(0xFFFF000000), width: 1.0),
      ),
      child: Text("VOTED",
        textScaleFactor: 1.2,
        textAlign: TextAlign.center,

        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Roboto',
          letterSpacing: 1.3,

        ),),
    );
    Widget VotedSVF = new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.green,
        border:  Border.all( color:const Color(0xFFFF000000), width: 1.0),
      ),
      child: Text("VOTED",
        textScaleFactor: 1.2,
        textAlign: TextAlign.center,

        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Roboto',
          letterSpacing: 1.3,

        ),),
    );
    Widget NotFeedbackSVF = new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.black26,
        border:  Border.all( color:const Color(0xFFFF000000), width: 1.0),
      ),
      child: Text("FEEDBACK",
        textScaleFactor: 1.2,
        textAlign: TextAlign.center,

        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Roboto',
          letterSpacing: 1.3,

        ),
      ),
    );
    Widget FeedbackSVF= new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.green,
        border:  Border.all( color:const Color(0xFFFF000000), width: 1.0),
      ),
      child: Text("FEEDBACK",
        textScaleFactor: 1.2,
        textAlign: TextAlign.center,

        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Roboto',
          letterSpacing: 1.3,

        ),),
    );

    Widget SVF = new Container();
    if(state=="b"){
      SVF= Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                flutterWebviewPlugin.close();
                wA();
              },
              child: Text("VOTE"),
            ),
            NotVotedSVF,
            NotFeedbackSVF
          ],

        ),
      );
    }
    else if(state=="c"){
      SVF= Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Empty,
            NotVotedSVF,
            NotFeedbackSVF
          ],

        ),
      );
    }
    else if(state=="d"){
      SVF= Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Empty,
            VotedSVF,
            NotFeedbackSVF
          ],

        ),
      );
    }
    else if(state=="e"){//skipped
      SVF= Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                flutterWebviewPlugin.close();
                wD();
              },
              child: Text("VOTE"),
            ),
            VotedSVF,
            NotFeedbackSVF
          ],

        ),
      );
    }

    else if(state=="f"){
      SVF= Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            VotedSVF,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              margin: EdgeInsets.only(top: 4.0),
              decoration: new BoxDecoration(
                color: Colors.white70,
                border:  Border.all( color:const Color(0xFFFF000000), width: 1.0),
              ),
              child: RaisedButton(
                elevation:5.0,
                color: Colors.yellowAccent[200],
                onPressed: () {
                  flutterWebviewPlugin.launch("https://docs.google.com/forms/d/e/1FAIpQLSexBkWOS0PMc1PLZDCbzwPx09mKbLHNsVp5bcwTgjRQxbUBYA/viewanalytics",
                      rect: new Rect.fromLTWH(
                          0.0, MediaQuery.of(context).size.height/8, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/1.5),
                      userAgent: kAndroidUserAgent);
                  wG();
                },
                child: Text("SUMMARY"),
              ),
            ),
            FeedbackSVF

          ],

        ),
      );
    }
    //TODO change to check vote
    else if(state=="g"){
      SVF= Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              child: Text("STATISTICS"),
            ),
            VotedSVF,
            FeedbackSVF
          ],

        ),

      );

    }
    else if(state!="b"||state!="c"||state!="d"||state!="e"||state!="f"||state!="g"||state!="h"){
      SVF= Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Empty,
            NotVotedSVF,
            NotFeedbackSVF,
          ],

        ),
      );
    }
    else{
      Container();
    }

    Widget ButtonSwap = new Container();
    if(state=="h"){//todo nothing
      ButtonSwap= Container(
        child: RaisedButton(
          onPressed: wB,
          child: Text("THIS IS h"),
        ),
      );
    }
    else if(state=="g"){
      ButtonSwap= Container(
        padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
        margin: EdgeInsets.only(top: 4.0),
        decoration: new BoxDecoration(
          color: Colors.white70,
          border:  Border.all( color:const Color(0xFFFF000000), width: 1.0),
        ),
        child: RaisedButton(
          color: Colors.red,
          onPressed: () {
            flutterWebviewPlugin.close();
            wF();
          },
          child: Text("CLOSE"),
        ),
      );
    }
    else if(state=="f"){//TODO skip
      ButtonSwap= Container(
        /*
        child: RaisedButton(
          onPressed: wG,
          child: Container(),//Text("FEEDBACK SUBMITTED"),
        ),
        */
      );
    }
    else if(state=="e"){
      ButtonSwap= RaisedButton(
        onPressed: null,//wF,
        child: LinearProgressIndicator(),//Text("....."),
      );
    }
    else if(state=="d"){
      ButtonSwap= Container(
        decoration: new BoxDecoration(
            border: Border.all(width: 1.0, color: const Color(0xFFFF000000))
        ),
        child: RaisedButton(
          elevation: 6.0,
          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          onPressed: () {
            flutterWebviewPlugin.launch("https://goo.gl/forms/t5qoAquAdlSRbOC32",
                rect: new Rect.fromLTWH(
                    0.0, MediaQuery.of(context).size.height/8, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/1.5),
                userAgent: kAndroidUserAgent);
            wE();
          },
          child: Text("Feedback Form"),
        ),
      );
    }
    /*
    else if(state=="c"){
      ButtonSwap= Container(
        child: RaisedButton(
          onPressed: wD,
          child: Text("Voting Done"),
        ),
      );
    }
    */
    else if(state=="b"){
      ButtonSwap= Container(
        child: RaisedButton(
          onPressed: null,//wC,
          child: LinearProgressIndicator(
          ),//Text("......"),
        ),

      );

    }
    else{
      ButtonSwap=Container(
        decoration: new BoxDecoration(
            border: Border.all(width: 1.0, color: const Color(0xFFFF000000))
        ),
        child: RaisedButton(
          elevation: 6.0,
          color: Colors.blue,

          padding: EdgeInsets.symmetric(horizontal: 20.0),
          onPressed: () {
            flutterWebviewPlugin.launch("https://goo.gl/forms/OlKJ6IKt4vsgTISV2",
                rect: new Rect.fromLTWH(
                    0.0, MediaQuery.of(context).size.height/8, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/1.5),
                userAgent: kAndroidUserAgent);
            wB();
          },
          child: Text("VOTE"),
        ),
      );
    }

//UPGRADEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
//END

    Widget titleSection =  new Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        margin: EdgeInsets.only(top: 4.0),
        decoration: new BoxDecoration(
            color: Colors.yellowAccent,
            border: Border.all(width: 1.0, color: const Color(0xFFFF000000))
        ),
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: new Text("GIVEAWAY PRIZE",
            textScaleFactor: 1.7,
            textAlign: TextAlign.center,

            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.3,

            ),
          ),
        )
    );

    Widget info = new Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Theme(
        data: ThemeData(fontFamily: ("Source_Sans_Pro"),
        ),
        child: new Column(
          children: <Widget>[
            new Text(
              "How to participate?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,

              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                color: Colors.yellowAccent,
                border: const Border(
                  top: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
                  left: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
                  right: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
                  bottom: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
                ),

              ),
              child: Column(
                children: <Widget>[
                  Text("Collect as many stamps from STEM Playground, to win MYSTERY GIFT when you exit! Enjoy!"),
                  Divider(),
                  Text("All participant shall collect SIX stamps from different booth and complete ONE feedback form to get one lucky draw ticket."),
                  Divider(),
                  Text("For second ticket and third ticket, all participant shall re-collect SIX stamps from another different booth (Stamping booth cannot be repeated!)."),
                  Divider(),
                  Text("Maximum – Three Lucky Draw tickets will be given for one passport."),
                  Divider(),
                  Text("*Only available before 8am Additional Note *Mentors/IEEE Helpers+1 *IEEE Committee +2 *(Must collect the lucky ticket before 8am during the briefing session) \n *Available all time EXTRA NOTE * Local members+2 * IEEE member +6 (+1 special) [Free Lapel Pin for new IEEE member] * Wearing IEEE Blue T-shirt +1 * Wearing IEEE SATE T-shirt +2 You may register IEEE international membership before 5 of August 11:59pm to stand a chance for IEEE Thermal Flask. Winner will be announced in the IEEE Curtin Malaysia Student Branch Facebook."),
                ],
              )
            ),
          ],
        ),
      ),
    );

    //NEW CODE
    Container prizeMain(String img, String amt){
      return Container(
        child:  Row(
          children: <Widget>[
            Expanded(
                child:  Card(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[

                      new Container(
                          height: 150.0,
                          alignment: AlignmentDirectional.center,
                          child:  Image.asset(img,
                            fit: BoxFit.fitWidth,
                          )
                      ),
                      new Text(
                        amt,
                        textScaleFactor: 1.4,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0,
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      );
    }
    Container prizesNormal (String img1, String amt1, String img2, String amt2){
      return new Container(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
                child: Card(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      Container(
                          height:150.0,
                          child: Image.asset(img1,
                            fit: BoxFit.fitHeight,
                          )
                      ),
                      Text(
                        amt1,
                        textScaleFactor: 1.4,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                )
            ),
            new Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    Card(
                        child:  Container(
                            height: 150.0,
                            child: Image.asset(img2,
                              fit: BoxFit.fitHeight,
                            )

                        )
                    ),
                    new Text(
                      amt2,
                      textScaleFactor: 1.4,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                )
            ),

          ],
        ),
      );
    }

    Container textPrize(String ticket){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ticket,
            textScaleFactor: 1.4,
            textAlign: TextAlign.center,

            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Roboto',
              letterSpacing: 1.3,

            ),
          ),
        ),
      );
    }

    //UPGRADEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

    //UPGRADEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


    return new MaterialApp(
      theme: new ThemeData(
        fontFamily: ("Archivo_Narrow"),
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        //accentColor: Colors.cyan[600],
        backgroundColor: Colors.white70,
      ),
      title: 'Voting and Prize Section',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('VOTING',
            style: new TextStyle(
                fontFamily: 'Julius_Sans_One'),
          ),
          centerTitle: true,

        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              ListView(
                children: <Widget>[
                  //titleSection,
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: SVF
                  ),
                  //prizes1,
                  Divider(),
                  Image.asset("assets/stemflyer.jpg", height: MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width ,),
                  Divider(),
                  info,
                  Divider(),
                  titleSection,
                  Column(
                    children: <Widget>[
                      textPrize("International Member Ticket"),
                      prizeMain("assets/ninswitch.jpg","x2"),
                      prizeMain("assets/m100.jpg","x2"),
                      textPrize("Normal Ticket"),
                      prizeMain("assets/m100.jpg","x2"),
                      prizeMain("assets/polaroid.jpg","x2"),
                      prizeMain("assets/alexa.jpg","x2"),
                      prizesNormal("assets/miband3.jpg","x2","assets/gamingheadset.jpg","x2"),
                      prizesNormal("assets/mipowerbank.jpg","x10","assets/m100.jpg","x8"),
                      prizesNormal("assets/gamingmouse.jpg","x2","assets/gamingkeyboard.png","x2"),
                    ],
                  ),

                  Container(
                    height: 70.0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Container(

                  margin: EdgeInsets.only(bottom: 10.0),
                  child: ButtonSwap,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


_launchURL() async {
  const url = 'https://goo.gl/forms/UikZ8jAvpCPzKlGF2';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }


}

class Storage {
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/db.txt');
  }

  Future<String> readData() async {
    try {
      final file = await localFile;
      String body = await file.readAsString();

      return body;
    } catch (e) {
      return e.toString();
    }
  }

  Future<File> writeData(String data) async {
    final file = await localFile;
    return file.writeAsString("$data");
  }
}
