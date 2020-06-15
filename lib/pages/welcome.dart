import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/logo_edx.png'),
            ),
            Text('Learning Management System', style: TextStyle(fontSize: 22),),
            SizedBox(height: 40,),
            Card(
              elevation: 5,
              color: Color.fromARGB(255, 238, 0, 0),
              child: Container(
                height: 36,
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/login'),
                  child: Center(
                    child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
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
