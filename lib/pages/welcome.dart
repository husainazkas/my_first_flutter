import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  String _search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/logo_edx.png'),
                    ),
                    Text('Learning Management System', style: TextStyle(fontSize: 22),),
                    SizedBox(height: 40,),
                    TextFormField(
                      onSaved: (search) => _search = search,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        hintText: 'Search..',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 200,),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                      splashColor: Colors.deepOrange,
                      color: Color.fromARGB(255, 238, 0, 0),
                      elevation: 5,
                      onPressed: () => Navigator.of(context).pushNamed('/register'),
                      child: Center(
                        child: Text('Create an account', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(width: 5,),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                      splashColor: Colors.deepOrange,
                      color: Color.fromARGB(255, 238, 0, 0),
                      elevation: 5,
                      onPressed: () => Navigator.of(context).pushNamed('/login'),
                      child: Center(
                        child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
