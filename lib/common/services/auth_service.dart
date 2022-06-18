import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/common/models/users/auth_user_model.dart';

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

  AuthUserModel _userFromFirebaseUser(User? user) {
    return user != null ? AuthUserModel(uid: user.uid) : AuthUserModel(uid: "");
  }

  @override
  Future login({required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      return null;
    }
  }

  @override
  Future register({required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      return null;
    }
  }
}
