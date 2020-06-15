import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {

  String _email, _pass, _fullname, _username, _country;
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  TextEditingController fullname = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController country = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[

              Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text("Create an account", style: TextStyle(fontSize: 25),)
              ),

              Container(
                  child: Text("Learning Management System", style: TextStyle(fontSize: 12, color: Colors.black45),)
              ),

              Form(
                key: _registerKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25,),

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
                          splashColor: Color.fromARGB(255, 172, 0, 0),
                          onTap: () => registerProceed(),
                          child: Center(
                            child: Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white,)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: FlatButton(
                  onPressed: () => Navigator.of(context).pop('/login'),
                  child: Text("Already have an account? Sign in.", style: TextStyle(fontSize: 14, color: Colors.black54),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerProceed() async {
    final registerState = _registerKey.currentState;
    if (registerState.validate()) {
      registerState.save();
      try {
        AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _pass);
        print('Account has been created and email verification has sent, redirecting to home..');
        result.user.sendEmailVerification();
        Navigator.pushNamedAndRemoveUntil(context, '/random-words', (Route<dynamic> route) => false);
      } catch (e) {
        print(e.message);
      }
    } else {
      print('Please re-check the form');
    }
  }
}