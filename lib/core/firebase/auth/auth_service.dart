import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // final FirebaseAuth _firebaseAuth;
  // AuthService(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // * Already in clean architecture -> check_user_auth_status
  // bool isLoggedIn() {
  //   return _firebaseAuth.currentUser?.uid != null;
  // }

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
      }
      result = true;
      return result;
      // Once signed in, returns the UserCredential
      // return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return result;
  }

  signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }
}
