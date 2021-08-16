import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
  dynamic errorMessage = '';

  dynamic get getErrorMessage => errorMessage;
  String uid;

  String get getUid => uid;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginIntoAccount(String email, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid);
      print('this is our uid => $getUid');
      notifyListeners();
    } catch (e) {
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'User Not Found';
          print(errorMessage);
          break;
        case 'wrong-password':
          errorMessage = 'Oops, wrong password!';
          print(errorMessage);
          break;
        case 'invalid-email':
          errorMessage = 'Sorry invalid e-mail';
          print(errorMessage);
          break;
      }
    }
  }

  Future createNewAccount(String email, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid);
      print('this is our uid => $getUid');
      notifyListeners();
    } catch (e) {
      switch (e) {
        case 'invalid-email':
          errorMessage = 'E-mail already in use';
          print(errorMessage);
          break;
        case 'account-exists-with-different-credential':
          errorMessage = 'Sorry invalid e-mail';
          print(errorMessage);
          break;
      }
    }
  }
}
