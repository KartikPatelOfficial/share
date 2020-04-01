import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_txt/model/user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return User.fromFirebaseUser(result.user);
  }

  void signOut() {
    _auth.signOut();
  }
}
