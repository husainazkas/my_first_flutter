import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfirstflutter/pages/random_words.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  String _email, _pass;
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
                    SizedBox(height: 25,),

                    TextFormField(
                      controller: emailInput,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => _email = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Invalid email address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email, size: 20,),
                        labelText: "Email",
                      ),
                    ),

                    SizedBox(height: 10,),

                    TextFormField(
                      controller: passInput,
                      obscureText: true,
                      onSaved: (value) => _pass = value,
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

                    SizedBox(height: 20,),

                    Card(
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
                  ],
                ),
              ),

              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: Text("Don't have an account? Sign Up.", style: TextStyle(fontSize: 14, color: Colors.black54),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginProceed() async {
    final loginState = _loginKey.currentState;
    if (loginState.validate()) {
      loginState.save();
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _pass);
        print('Logged in, redirect to home.');
        FirebaseUser user = result.user;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RandomWords(user: user,)) , (Route<dynamic> route) => false);
      } catch(e) {
        print(e.message);
      }
    } else {
      print("Login failed");
    }
  }
}