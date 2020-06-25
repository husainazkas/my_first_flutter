import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogle {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
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
    user = result.user;

    print('You have been signed in');
    _sendDataToDatabase(user.uid);
  }

  void _sendDataToDatabase(String uid) {

    final dbRef = FirebaseDatabase.instance.reference().child('/users/$uid');
    print('Sending data user to database..');
    try {
      dbRef.set(
        {
          'Fullname' : user.displayName,
          'Email' : user.email,
          'PhotoURL' : user.photoUrl,
          'UID' : user.uid,
          'Username' : 'null',
          'Country' : 'null'
        },
      );
      print('Send to database success, redirecting to home..');
    } catch (e){
      print(e);
    }
  }
}
