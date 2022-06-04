import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/models/auth_user_model.dart';
import 'package:flutter_application/models/user_model.dart';

abstract class AuthService {
  Future login({
    required String email,
    required String password,
  });
  Future register({
    required String email,
    required String password,
  });
}

class AuthFirebaseService extends AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthUserModel _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? AuthUserModel(uid: user.uid) : AuthUserModel(uid: "");
  }

  Stream<AuthUserModel> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  @override
  Future login({required String email, required String password}) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      return null;
    }
  }

  @override
  Future register({required String email, required String password}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      return null;
    }
  }
}
