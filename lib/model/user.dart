import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User {
  String id;
  String email;

  User({@required this.id, @required this.email});

  factory User.fromFirebaseUser(FirebaseUser user) {
    return User(id: user.uid, email: user.email);
  }
}
