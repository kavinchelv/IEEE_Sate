import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Sponsors extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Exhbition Map',
      theme: new ThemeData(
        fontFamily: ("Archivo_Narrow"),
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.black87,
      ),

      home: new Sponsors1(),
    );
  }
}
class Sponsors1 extends StatefulWidget{
  @override
  _Sponsors createState() => new _Sponsors();
}
class _Sponsors extends State<Sponsors1>{
  PageController _mapController;
  PageController _floorController;// set the current page
  int _pageMap = 0;
  int _pageFloor = 0;
  //String googleMapsApiKey = 'AIzaSyCyQkBfGuJwUqz2dJnEa99hDvOTZ87D2pw';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text(
              'Venue',
            style: new TextStyle(fontFamily: 'Julius_Sans_One')
          ),
          /*
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.map),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GMaps(googleMapsApiKey)),
                );
              },
              iconSize: 30.0,
              color: Colors.white,
            ),
          ],
*/
        ),
        body: new PageView(
            physics:new NeverScrollableScrollPhysics(),
            children: [
              Scaffold(
                body: new PageView(
                  physics:new NeverScrollableScrollPhysics(),
                    children: [
                      new Container(
                          color: Colors.blue,
                          child: new PhotoView(
                              minScale: 0.5,
                              maxScale: 0.7,
                              imageProvider: new AssetImage("assets/libbasefloor.png")
                          )
                      ),
                      new Container(
                          color: Colors.blue,
                          child: new PhotoView(
                              minScale: 0.5,
                              maxScale: 0.7,
                              imageProvider: new AssetImage("assets/libgroundfloor.jpg")
                          )
                      ),
                      new Container(
                          color: Colors.blue,
                          child: new PhotoView(
                              minScale: 0.5,
                              maxScale: 0.7,
                              imageProvider: new AssetImage("assets/libfirstfloor.jpg")
                          )
                      )
                    ],
                    controller: _floorController,//map controller
                    onPageChanged: onFloorChange // Updates the page changed// Updates the page changed
                ),
                  bottomNavigationBar: new BottomNavigationBar(
                    fixedColor: Colors.orangeAccent,
                    iconSize: 15.0,
                    items: [
                      new BottomNavigationBarItem(
                          icon: new Icon(Icons.format_align_right),
                          title: new Text("BASE")
                      ),
                      new BottomNavigationBarItem(
                          icon: new Icon(Icons.format_align_justify),
                          title: new Text("GROUND")
                      ),
                      new BottomNavigationBarItem(
                          icon: new Icon(Icons.format_align_left),
                          title: new Text("FIRST")
                      ),
                    ],
                    onTap:floorChange, // runs the map change function
                    currentIndex: _pageFloor,
                  )
              ),
              /*
              new Container(
                  color: Colors.red,
                  child: new PhotoView(
                    minScale: 0.5,
                      maxScale: 1.5,
                      imageProvider: new NetworkImage("http://www.wsicuttingedgeedesign.com/wp-content/uploads/space-background-93-best-space-images-on-pinterest.jpg")
                  )
              ),
              */
              new Container(
                  color: Colors.blue,
                  child: new PhotoView(
                      minScale: 0.5,
                      maxScale: 1.5,
                      imageProvider: new AssetImage("assets/outsidevenue.jpeg")
                  )
              )
            ],
            controller: _mapController,//map controller
            onPageChanged: onMapChanged // Updates the page changed
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.book),
                title: new Text("Library")
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.local_activity),
                title: new Text("Outdoor")
            ),
          ],
          onTap:mapChange, // runs the map change function
          currentIndex: _pageMap,
        )
    );
  }

  void mapChange(int page){
    _mapController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
  }

  void onMapChanged(int page){
    setState(() {
      this._pageMap = page;
    });
  }

  void floorChange(int page){
    _floorController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
  }

  void onFloorChange(int page){
    setState(() {
      this._pageFloor = page;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mapController = new PageController();
    _floorController = new PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mapController.dispose();
    _floorController.dispose();
  }
}