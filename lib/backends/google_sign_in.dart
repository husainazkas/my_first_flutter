import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogle {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<void> signInWithGoogle() async {
    print('Select google account');
    GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleSignInAuthentication = await _googleSignInAccount.authentication;

    AuthCredential _credential = GoogleAuthProvider.getCredential(
        idToken: _googleSignInAuthentication.idToken,
        accessToken: _googleSignInAuthentication.accessToken
    );

    AuthResult result = (await _auth.signInWithCredential(_credential));
    _user = result.user;

    print('You have been signed in');
    _sendDataToDatabase();
  }

  void _sendDataToDatabase() {

    final dbRef = FirebaseDatabase.instance.reference().child('/users/${_user.uid}');
    print('Sending data user to database..');
    try {
      dbRef.update(
        {
          'Fullname' : _user.displayName,
          'Email' : _user.email,
          'PhotoURL' : _user.photoUrl,
          'UID' : _user.uid,
        },
      );
      print('Send to database success, redirecting to home..');
    } catch (e){
      print(e.message);
    }
  }

  Future<Null> googleSignOut() async {
    if (_googleSignIn.currentUser != null) {
      _googleSignIn.signOut();
      print('Signed out.');
    } else {
      print('You already signed out.');
    }
  }
}
