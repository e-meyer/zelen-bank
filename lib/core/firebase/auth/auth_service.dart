import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zelenbank/authentication/presentation/ui/login_screen/view/login_screen.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/view/statement_screen.dart';

class AuthService {
  // final FirebaseAuth _firebaseAuth;
  // AuthService(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Determine if the user is authenticated
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        Future.delayed(Duration(milliseconds: 5));
        print('fdp1 ${snapshot.data}');
        if (snapshot.hasData && isSignIn()) {
          print('fdp2');
          return StatementScreen();
        } else {
          print('fdp3');
          return LoginScreen();
        }
      },
    );
  }

  bool isSignIn() {
    if (_firebaseAuth.currentUser?.uid != null) {
      return true;
    }
    return false;
  }

  signInWithGoogle() async {
    bool result = false;
    try {
      // Triggers the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      // Obtains the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Creates a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null && userCredential.additionalUserInfo!.isNewUser) {
        // add the data to the firebase
        _firebaseFirestore.collection('users').doc(user.uid).set(
          {
            'uid': user.uid,
            'userName': user.displayName,
            'profilePhotoUrl': user.photoURL,
          },
        );

        result = true;
      }
      return result;
      // Once signed in, returns the UserCredential
      // return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
    return result;
  }

  signOut() {
    _firebaseAuth.signOut();
  }
}
