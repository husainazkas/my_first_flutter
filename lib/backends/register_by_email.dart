import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignInWithEmail {

  FirebaseUser user;
  Future<void> registerProceed(String _email, _pass) async {
    try {
      AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _pass);
      user = result.user;
      print('Account has been created.');
      print('Sending email verification..');
      user.sendEmailVerification();
    } catch (e) {
      print(e.message);
    }
  }

  void sendDataToDatabase(String _email, _pass, _fullname, _username, _country) {

    final dbRef = FirebaseDatabase.instance.reference().child('/users/${user.uid}');
    print('Sending data user to database..');
    try {
      dbRef.set(
          {
            'Fullname' : _fullname,
            'Username' : _username,
            'Email' : _email,
            'Country' : _country,
            'UID' : user.uid,
          }
      ).then((db) => print('Send to database success, redirecting to home..'));
    } catch (e) {
      print(e.message);
    }
  }
}