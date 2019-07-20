import 'package:flutter/material.dart';
import 'package:ieee_sate/Auth/auth.dart';
import 'package:ieee_sate/Committee.dart';
import 'package:provider/provider.dart';
import 'dart:async';
class DrawerCard extends StatefulWidget {

  @override
  _DrawerCardState createState() => _DrawerCardState();
}

class _DrawerCardState extends State<DrawerCard> {

  //_DrawerCardState(AuthService.iC,this.cV);
  final success = SnackBar(content: Text('Login Successful!'), backgroundColor: Colors.green[400]);
  final fail = SnackBar(content: Text('Sucessfully Signed Out!'), backgroundColor: Colors.grey[700]);
  Future<void> _handleSignIn() async {
    try {
      await authService.googleSignIn();
      setState(() {
        iC=true;
        iA=true;
        Navigator.pop(context);
        Scaffold.of(context).showSnackBar(success);
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    try {
       authService.googleSignOut();
       setState(() {
         iC=false;
         iA=false;
         Navigator.pop(context);
         Scaffold.of(context).showSnackBar(fail);
       });
    } catch (error) {
      print(error);
    }
  }


  Widget userStatus() {
    if (!iA) {
      return ListTile(
        title: Text('Sign In (Students)'),
        onTap: () {
          _handleSignIn();

        },
      );
    }
    else {
      return ListTile(
        title: Text('Sign Out (Students)'),
        onTap: () {
          _handleSignOut();
          /*
          iA=false;
          Navigator.pop(context);
          Scaffold.of(context).showSnackBar(fail);
          */
        },
      );
    }
  }
  // Access private data for Level 3 Users (Committee) or higher
  Widget roleView(AppState appState) {
    if (iC) {
      if (cV) {
        return ListTile(
          title: Text('Default View'),
          onTap: () {
            // Update the state of the app.
            // ...
            setState(() {
              cV = false;
              appState.setPageIndex(cV);
            });
            //MyHomePage.index=2;
            //myHome.rebuild();
            Navigator.pop(context);
          },
        );
      }
      else {
        return ListTile(
          title: Text('Special View'),
          onTap: () {
            setState(() {
              cV = true;
              appState.setPageIndex(cV);
            });
            //myHome.rebuild();
            Navigator.pop(context);
          },
        );
      }
    }
    else
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    //return Text(widget.dog.name);
    final appState = Provider.of<AppState>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Text('IEEE SATE')),
            curve: SawTooth(40),

          ),
          ListTile(
            title: Text('Digital Lucky Draw'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('QR Code'),
            onTap: () {
                authService.userRole('google.com');
              // Update the state of the app.
              // ...
            },
          ),
          userStatus(),
          roleView(appState), // for committee access

        ],
      ),
    );
  }
}

final DrawerCard drawerCard = DrawerCard();