import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

bool iC=false;  // check if user is Committee
bool cV=false;  // check if user current state of committee view
bool iA=false; // check if user is Authenticated

class AuthService {
  // Dependencies

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    /*
    scopes: [
      'email', //https://developers.google.com/identity/protocols/googlescopes more permission
    ],
    */
    //hostedDomain: 'curtin.edu.my',
  );
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Firestore _db = Firestore.instance;

  // Shared State for Widgets
  Observable<FirebaseUser> user; // firebase user
  Observable<Map<String, dynamic>> profile; // custom user data in Firestore
  PublishSubject loading = PublishSubject();



  // constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser user) {
      if (user != null) {
        return _db
            .collection('users')
            .document(user.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });
  }
  //authentication code

  Future<FirebaseUser> googleSignIn() async {
// Start
    loading.add(true);

    // Step 1
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Step 2
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      //breaking change work around implementation
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser user = await _auth.signInWithCredential(credential);

    // Step 3
    updateUserData(user);
    iC=true;
    // Done
    loading.add(false);
    print("signed in " + user.displayName);

    return user;
  }


   Future<Null> googleSignOut() async{

    // Sign out with FireBase
    await _auth.signOut();
    // Sign out with google
    // Does not disconnect however.
    await _googleSignIn.signOut();

    iC=true;
    // Done
    print("signed out ");
  }

  void userRole(String email){
    Firestore.instance
        .collection('comittee')
        .document('Admin_List')
        .get()
        .then((DocumentSnapshot admin) {
          print(admin);

      // use ds as a snapshot
    });

    Firestore.instance
        .collection('comittee')
        .document('List_of_emails')
        .get()
        .then((DocumentSnapshot committee) {
          print(committee);

      // use ds as a snapshot
    });


  }
  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now(),
      'role':'Outsider',
      'points':0
    }, merge: true);

  }




}

final AuthService authService = AuthService();

