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
                    Image.asset('assets/logo_edx.png'),
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

              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                ),
                splashColor: Colors.deepOrange,
                color: Color.fromARGB(255, 238, 0, 0),
                elevation: 5,
                onPressed: () => Navigator.of(context).pushNamed('/login'),
                child: Center(
                  child: Text('Get into your account', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),

              SizedBox(height: 10,),

              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    height: 1,
                  ),

                  Text('Sign in with', style: TextStyle(fontSize: 16),),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    height: 1,
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(

                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/google-logo.png', width: 14, height: 14,),
                          SizedBox(width: 4,),
                          Text('Google', style: TextStyle(fontSize: 14),)
                        ],
                      ),
                    ),
                  ),

                  /*Container(
                    child: Image(
                      image: AssetImage('assets/'),
                    ),
                  )*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
