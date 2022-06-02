import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/models/auth_user_model.dart';
import 'package:flutter_application/models/user_model.dart';

abstract class AuthService {
  void login({
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

  // create user obj based on firebase user
  AuthUserModel _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? AuthUserModel(uid: user.uid) : AuthUserModel(uid: "");
  }

  // auth change user stream
  Stream<AuthUserModel> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  @override
  void login({required String email, required String password}) {
    // TODO: implement login
  }

  @override
  Future register({required String email, required String password}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }
}
