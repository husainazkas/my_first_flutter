import 'package:flutter/material.dart';
import 'package:myfirstflutter/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
      ),
      body: Container(
        child: RaisedButton(
          child: Text('Login as Anonymous'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('error signing in');
            } else {
              print('signed in');
              print(result);
            }
          },
        ),
      ),
    );
  }
}