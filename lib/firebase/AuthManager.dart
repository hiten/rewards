import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthManager();

  /// SignIn the user using this function
  Future<FirebaseUser> signInUser(String email, String password) async {
    try {
      // Sign in using the email password mechanism provided by google
      var loggedInUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return loggedInUser;
    } catch (exception) {
      // Print the exception
      print(exception);
      return throw exception;
    }
  }

  /// Create a new user
  /// Update the user with the display name
  Future<FirebaseUser> createUser(String email, String password) async {
    try {
      /// Create a new user
      return await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (exception) {
      print(exception);
      throw exception;
    }
  }

  /// Logout the user
  Future<bool> logoutCurrentUser() async {
    try {
      // Returns void if success
      void result = await _firebaseAuth.signOut();
      return true;
    } catch (exception) {
      print(exception);
      return false;
    }
  }
}
