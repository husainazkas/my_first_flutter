import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/myfirstflutter/lib/pages/setup/welcome.dart';
import 'package:myfirstflutter/pages/random_words.dart';
import 'package:myfirstflutter/pages/setup/login.dart';
import 'package:myfirstflutter/pages/setup/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 238, 0, 0),
        accentColor: Color.fromARGB(255, 172, 0, 0),
      ),
      home: RandomWords(),
      routes: <String, WidgetBuilder> {
        '/register' : (BuildContext context) => Register(),
        '/login' : (BuildContext context) => Login(),
        '/welcome' : (BuildContext context) => Welcome(),
        '/random-words' : (BuildContext context) => RandomWords(),
      },
    );
  }
}