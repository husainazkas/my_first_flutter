import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutter/backends/google_sign_in.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  String _search;
  SignInWithGoogle signInWithGoogle = SignInWithGoogle();

  void _handleGoogleSignIn() {
    print('Initializing google sign in');
    signInWithGoogle.signInWithGoogle().then(
            (google) => Navigator.pushNamedAndRemoveUntil(context, '/random-words', (Route<dynamic> route) => false)
    );
  }

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
                padding: const EdgeInsets.symmetric(vertical: 0),
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

              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                ),
                splashColor: Colors.deepOrange,
                color: Color.fromARGB(255, 238, 0, 0),
                elevation: 5,
                onPressed: () => Navigator.of(context).pushNamed('/login'),
                child: Center(
                  child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                ),
                //splashColor: Colors.deepOrange,
                color: Colors.deepOrange,
                elevation: 5,
                onPressed: () => Navigator.of(context).pushNamed('/register'),
                child: Center(
                  child: Text('Register', style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
              ),

              SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ),
                  Text('Quick login with', style: TextStyle(fontSize: 16),),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  RaisedButton(
                    onPressed: () => _handleGoogleSignIn(), //signInWithGoogle.signInWithGoogle,
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google-logo.png', width: 14, height: 14,),
                        SizedBox(width: 8,),
                        Text('Google', style: TextStyle(fontSize: 14),)
                      ],
                    ),
                  ),

                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    color: Color.fromARGB(255, 59, 89, 152,),
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/facebook-logo-white.png', width: 12, height: 12,),
                        SizedBox(width: 8,),
                        Text('Facebook', style: TextStyle(fontSize: 14, color: Colors.white),)
                      ],
                    ),
                  ),

                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    color: Color.fromARGB(255, 0, 172, 238,),
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/twitter-logo-white.png', width: 14, height: 14,),
                        SizedBox(width: 8,),
                        Text('Twitter', style: TextStyle(fontSize: 14, color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
