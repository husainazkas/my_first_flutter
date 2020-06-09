import 'package:flutter/material.dart';
import 'package:myfirstflutter/random_words.dart';
import 'package:myfirstflutter/register.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 172, 0, 0)),
                  ),
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email, size: 20,),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 172, 0, 0)),
                  ),
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock, size: 20,),
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
                      onTap: () => RandomWords(),
                      child: Center(
                        child: Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                      )
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Card(
                child: Container(
                  child: InkWell(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Register()
                    )),
                    child: Center(
                      child: Text("Don't have an account? Sign Up.", style: TextStyle(fontSize: 14, color: Colors.black54),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}