import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  String email = 'name@email.com';
  String pass = '111111';

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  TextEditingController emailInput = new TextEditingController();
  TextEditingController passInput = new TextEditingController();

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
                  child: Text("Login to your account", style: TextStyle(fontSize: 25),)
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Text("Learning Management System", style: TextStyle(fontSize: 12, color: Colors.black45),)
              ),

              Form(
                key: _loginKey,
                child: Column(
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: TextFormField(
                        controller: emailInput,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Invalid email address";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email, size: 20,),
                          labelText: "Email",
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TextFormField(
                        controller: passInput,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Invalid password";
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
                      child: Card(
                        color: Color.fromARGB(255, 238, 0, 0),
                        child: Container(
                          height: 40,
                          child: InkWell(
                              splashColor: Color.fromARGB(255, 172, 0, 0),
                              onTap: () => loginProceed(),
                              child: Center(
                                child: Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: FlatButton(
                  onPressed: () => Navigator.of(context).pop('/register'),
                  child: Text("Don't have an account? Sign Up.", style: TextStyle(fontSize: 14, color: Colors.black54),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginProceed() {
    if (_loginKey.currentState.validate()) {
      if (emailInput.text == email && passInput.text == pass) {
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
      } else {
        print("Invalid email or password");
      }
    } else {
      print("Login failed");
    }
  }
}