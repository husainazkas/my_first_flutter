import 'package:flutter/material.dart';
import 'package:myfirstflutter/random_words.dart';
import 'package:myfirstflutter/login.dart';
import 'package:myfirstflutter/register.dart';

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
      routes: <String, WidgetBuilder> {
        '/register' : (BuildContext context) => Register(),
        '/login' : (BuildContext context) => Login(),
        '/home' : (BuildContext context) => RandomWords(),
      },
    );
  }
}