import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/models/user_model.dart';

abstract class DatabaseService {
  Future insertUser({
    required String emailID,
    required String name,
  });
  Future updateUser({
    required String emailID,
    required String name,
  });
  Future deleteUser({
    required String emailID,
    required String name,
  });
  Future checkIfUserExists({
    required String emailID,
    required String name,
  });
  Stream<List<UserModel>> getAllUsers({required String emailID});
  Stream getUser({required String emailID, required String name});
}

class DatabaseFireStoreService extends DatabaseService {
  // collection reference
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  String seperator = "_";

  @override
  Future insertUser({required String emailID, required String name}) async {
    if (!(await checkIfUserExists(emailID: emailID, name: name))) {
      return await _userCollection
          .doc(emailID + seperator + name)
          .set({'emailID': emailID, 'name': name}, SetOptions(merge: true));
    }
    return null;
  }

  @override
  Future updateUser({required String emailID, required String name}) async {
    if (await checkIfUserExists(emailID: emailID, name: name)) {
      deleteUser(emailID: emailID, name: name);
      insertUser(emailID: emailID, name: name);
    }
    return null; //User konnte nicht geupdatet werden!
  }

  @override
  Future deleteUser({required String emailID, required String name}) async {
    if (await checkIfUserExists(emailID: emailID, name: name)) {
      return await _userCollection.doc(emailID + seperator + name).delete();
    }
    return null; //User konnte nicht entfernt werden!
  }

  @override
  Future checkIfUserExists(
      {required String emailID, required String name}) async {
    if ((await _userCollection.doc(emailID + seperator + name).get()).exists) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Stream<List<UserModel>> getAllUsers({required String emailID}) {
    Stream<QuerySnapshot> stream =
        _userCollection.where('emailID', isEqualTo: emailID).snapshots();

    stream.listen((event) {
      event.docs.forEach((element) {
        print("Service:" + element.get('name'));
      });
    });

    return stream.map((qShot) => qShot.docs
        .map((doc) => UserModel(doc.get('emailID'), doc.get('name'), false))
        .toList());
  }

  @override
  Stream getUser({required String emailID, required String name}) {
    return _userCollection
        .where('emailID', isEqualTo: emailID)
        .where('name', isEqualTo: name)
        .snapshots();
  }
}
