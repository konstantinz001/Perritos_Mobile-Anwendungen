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
  Future loadUserList({required String email});
}

class AuthFirebaseService extends AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthUserModel _userFromFirebaseUser(User? user) {
    return user != null ? AuthUserModel(uid: user.uid) : AuthUserModel(uid: "");
  }

  /*Stream<AuthUserModel> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }*/

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

  @override
  Future loadUserList({required String email}) async {
    //Load Where emailID = email
    print(email);
    try {
      List<UserModel> uList = await [
        const UserModel("test@web.de", "Mom", false),
        const UserModel("test@web.de", "Dad", false),
        const UserModel("test@web.de", "Lisa", false)
      ];
      return uList;
    } catch (error) {
      return null;
    }
  }
}
