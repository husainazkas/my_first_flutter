import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {

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
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: TextFormField(
                        controller: fullname,
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
                    ),

                    SizedBox(height: 20,),

                    Container(
                      //padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: TextFormField(
                        controller: username,
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
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: TextFormField(
                        controller: email,
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
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: TextFormField(
                        controller: pass,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You must set a password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock, size: 20,),
                          labelText: "Password",
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: TextFormField(
                        controller: country,
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
                            onTap: () => registerProceed(),
                              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RandomWords()));,
                            child: Center(
                              child: Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white,)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text("Already have an account? Sign in.", style: TextStyle(fontSize: 14, color: Colors.black54),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerProceed() {
    if (_registerKey.currentState.validate()) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print('Please re-check the form');
    }
  }
}