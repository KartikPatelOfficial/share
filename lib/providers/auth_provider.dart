import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_txt/service/auth_service.dart';

class AuthProvider with ChangeNotifier, AuthService {
  FirebaseUser user;
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthProvider() {
    _auth.onAuthStateChanged.listen((newUser) {
      user = newUser;
      notifyListeners();
    }, onError: (e) {
      print('Error encountred at AuthProvider - $e');
    });
  }

  bool get isAuthenticated => user != null;
}
