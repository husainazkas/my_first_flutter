import 'package:flutter/material.dart';
import 'package:myfirstflutter/random_words.dart';
import 'package:myfirstflutter/register.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[

              Form(
                key: _loginKey,
                child: Column(
                  children: <Widget>[

                    Container(
                      child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Invalid email address";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email, size: 20,),
                          labelText: "Email",
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TextFormField(
                        controller: pass,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Invalid password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock, size: 20,),
                          labelText: "Password",
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Card(
                        color: Color.fromARGB(255, 238, 0, 0),
                        child: Container(
                          height: 40,
                          child: InkWell(
                              splashColor: Color.fromARGB(255, 172, 0, 0),
                              onTap: () => loginProceed(),
                              child: Center(
                                child: Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Register()
                  )),
                  child: Text("Don't have an account? Sign Up.", style: TextStyle(fontSize: 14, color: Colors.black54),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginProceed() {
    if (_loginKey.currentState.validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => RandomWords(),
      ));
    } else {
      print("Login failed");
    }
  }
}