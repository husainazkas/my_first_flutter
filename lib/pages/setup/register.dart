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
                            border: OutlineInputBorder(),
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
                            border: OutlineInputBorder(),
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
                            border: OutlineInputBorder(),
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
                            border: OutlineInputBorder(),
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
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.location_on, size: 20,),
                            hintText: "Indonesia",
                            labelText: "Select your country",
                          ),
                        ),

                        SizedBox(height: 20,),

                        Card(
                          color: Color.fromARGB(255, 238, 0, 0),
                          elevation: 5,
                          child: Container(
                            height: 40,
                            child: InkWell(
                              splashColor: Colors.deepOrange,
                              onTap: () => _registerProceed(),
                              child: Center(
                                child: Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white,)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  FlatButton(
                    onPressed: () => Navigator.of(context).pop('/login'),
                    child: Text("Already have an account? Sign in.", style: TextStyle(fontSize: 14, color: Colors.black54),)
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

    final dbRef = FirebaseDatabase.instance.reference().child('/users/$uid');
    dbRef.push().set(data).then((db) {
      print('Send to database success');
      Navigator.pushNamedAndRemoveUntil(context, '/random-words', (Route<dynamic> route) => false);
    });
    //
  }
}