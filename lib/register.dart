import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutter/random_words.dart';
import 'package:myfirstflutter/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to My First Flutter',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 238, 0, 0),
        accentColor: Color.fromARGB(255, 172, 0, 0),
      ),
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 238, 0, 0),
                ),
                child: Center(
                  child: Icon(Icons.person, size: 50, color: Colors.white,),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 172, 0, 0)),
                    ),
                    prefixIcon: Icon(Icons.person, size: 20,),
                    hintText: "Your Name",
                    labelText: "Name",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 172, 0, 0)),
                    ),
                    prefixIcon: Icon(Icons.email, size: 20,),
                    hintText: "Email",
                    labelText: "Email",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 172, 0, 0)),
                    ),
                    prefixIcon: Icon(Icons.lock, size: 20,),
                    hintText: "Password",
                    labelText: "Password",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Card(
                  color: Color.fromARGB(255, 238, 0, 0),
                  elevation: 5,
                  child: Container(
                    height: 40,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 172, 0, 0),
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => RandomWords()
                      )),
                      child: Center(
                        child: Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white,)),
                      ),
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
                        builder: (context) => Login()
                      )),
                      child: Center(
                        child: Text("Already have an account? Sign in.", style: TextStyle(fontSize: 14, color: Colors.black54),),
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