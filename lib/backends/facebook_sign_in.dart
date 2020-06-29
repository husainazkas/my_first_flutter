import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SignInWithFacebook {

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> signInWithFacebook() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> facebookSignOut() async {
    if (facebookSignIn.currentAccessToken != null) {
      await facebookSignIn.logOut();
      print('Signed out.');
    } else {
      print('You already signed out.');
    }
  }

}