import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {

  static String _email, _pass, _fullname, _username, _country;
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  TextEditingController fullname = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController country = new TextEditingController();

  FirebaseUser user;

  var data = <String, dynamic> {
    'Fullname' : _fullname.toString(),
    'Username' : _username.toString(),
    'Email' : _email.toString(),
    'Country' : _country.toString(),
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Column(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 40,),
                            Text("Create an account", style: TextStyle(fontSize: 30, color: Colors.white),),
                            Text("Learning Management System", style: TextStyle(fontSize: 14, color: Colors.white),),
                            SizedBox(height: 16,),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Form(
                    key: _registerKey,
                    child: Column(
                      children: <Widget>[

                        TextFormField(
                          controller: fullname,
                          onSaved: (value) => _fullname = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 238, 0, 0))
                            ),
                            prefixIcon: Icon(Icons.person),
                            labelText: "Full Name",
                            hintText: "Your Full Name",
                          ),
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          controller: username,
                          onSaved: (value) => _username = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You need to set an username";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: Icon(Icons.person_outline, size: 20,),
                            hintText: "example123",
                            labelText: "Username",
                          ),
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          controller: email,
                          onSaved: (value) => _email = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your email address";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: Icon(Icons.email, size: 20,),
                            hintText: "youremail@example.com",
                            labelText: "Email",
                          ),
                        ),

                        SizedBox(height: 20,),

                        TextFormField(
                          controller: pass,
                          obscureText: true,
                          onSaved: (value) => _pass = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'You must set a password';
                            } else if (value.length < 6) {
                              return "Password must at least 6 characters";
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

                        TextFormField(
                          controller: country,
                          onSaved: (value) => _country = value,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your country";
                            }
                            return null;
                          },
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: Icon(Icons.location_on, size: 20,),
                            hintText: "Indonesia",
                            labelText: "Select your country",
                          ),
                        ),

                        SizedBox(height: 20,),

                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                          ),
                          splashColor: Colors.deepOrange,
                          color: Color.fromARGB(255, 238, 0, 0),
                          elevation: 5,
                          onPressed: () => _registerProceed(),
                          child: Center(
                            child: Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white,)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Already have an account? Sign in.", style: TextStyle(fontSize: 14, color: Colors.black54),)
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
                      Text('or', style: TextStyle(fontSize: 16),),
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
                        onPressed: () {},
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
                            Text('Sign Up with Google', style: TextStyle(fontSize: 14),)
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
                            Text('Sign Up with Facebook', style: TextStyle(fontSize: 14, color: Colors.white),)
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
                            Text('Sign Up with Twitter', style: TextStyle(fontSize: 14, color: Colors.white),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _registerProceed() async {
    final registerState = _registerKey.currentState;
    if (registerState.validate()) {
      registerState.save();
      try {
        AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _pass);
        print('Account has been created and email verification has sent, redirecting to home..');
        result.user.sendEmailVerification();
        return _sendDataToDatabase(result.user.uid);
      } catch (e) {
        print(e.message);
      }
    } else {
      print('Please re-check the form');
    }
  }

  Future<void> _sendDataToDatabase(String uid) async {
    FirebaseDatabase dbCached = FirebaseDatabase.instance;
    dbCached.setPersistenceEnabled(true);
    dbCached.setPersistenceCacheSizeBytes(10000000);

    final dbRef = FirebaseDatabase.instance.reference().child('/users-with-email/$uid');
    dbRef.push().set(
        {
          data : data,
          'UID' : user.uid
        }
    ).then((db) {
      print('Send to database success');
      Navigator.pushNamedAndRemoveUntil(context, '/random-words', (Route<dynamic> route) => false);
    });
    //
  }
}