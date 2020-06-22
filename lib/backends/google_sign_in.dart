import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfirstflutter/pages/random_words.dart';

class googleSignIn extends StatefulWidget {
  @override
  _googleSignInState createState() => _googleSignInState();
}

class _googleSignInState extends State<googleSignIn> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleSignInAuthentication = await _googleSignInAccount.authentication;

    AuthCredential _credential = GoogleAuthProvider.getCredential(
        idToken: _googleSignInAuthentication.idToken,
        accessToken: _googleSignInAuthentication.accessToken
    );

    AuthResult _result = (await _auth.signInWithCredential(_credential));
    _user = _result.user;
    setState(() {
      print('You have been signed in');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RandomWords(user: _user,)) , (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



