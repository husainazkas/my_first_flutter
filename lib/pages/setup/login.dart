import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfirstflutter/pages/random_words.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  String _email, _pass;
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  TextEditingController emailInput = new TextEditingController();
  TextEditingController passInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 172, 0, 0),
                    Color.fromARGB(255, 255, 0, 0),
                    Colors.orange[800],
                  ],
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Text("Login to your account", style: TextStyle(fontSize: 30, color: Colors.white))
                          ),

                          Container(
                              padding: EdgeInsets.only(top: 6),
                              child: Text("Learning Management System", style: TextStyle(fontSize: 14, color: Colors.white),)
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 16,)
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Form(
                    key: _loginKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25,),

                        TextFormField(
                          controller: emailInput,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) => _email = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Invalid email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: Icon(Icons.email, size: 20,),
                            labelText: "Email",
                          ),
                        ),

                        SizedBox(height: 10,),

                        TextFormField(
                          controller: passInput,
                          obscureText: true,
                          onSaved: (value) => _pass = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Invalid password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: Icon(Icons.lock, size: 20,),
                            labelText: "Password",
                          ),
                        ),

                        SizedBox(height: 20,),
                      ],
                    ),
                  ),

                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    splashColor: Colors.deepOrange,
                    color: Color.fromARGB(255, 238, 0, 0),
                    elevation: 5,
                    onPressed: () => _loginProceed(),
                    child: Center(
                      child: Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                    ),
                  ),

                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: Text("Don't have an account? Sign Up.", style: TextStyle(fontSize: 14, color: Colors.black54),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loginProceed() async {
    final loginState = _loginKey.currentState;
    if (loginState.validate()) {
      loginState.save();
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _pass);
        print('Logged in, redirect to home.');
        FirebaseUser user = result.user;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RandomWords(user: user,)) , (Route<dynamic> route) => false);
      } catch(e) {
        print(e.message);
      }
    } else {
      print("Login failed");
    }
  }
}