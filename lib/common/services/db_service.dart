import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'package:flutter_application/common/models/user_model.dart';

abstract class DatabaseService {
  //User:
  Future insertUser(
      {required String emailID,
      required String name,
      required String iconName,
      required String iconColor});
  Future updateUser(
      {required String emailID,
      required String name,
      required String iconName,
      required String iconColor});
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

  //ActionDate:
  Stream getAllActionDates({required String emailID});
}

class DatabaseFireStoreService extends DatabaseService {
  // collection reference
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _actionDateCollection =
      FirebaseFirestore.instance.collection('actionDates');

  String seperator = "_";

//User:
  @override
  Future insertUser(
      {required String emailID,
      required String name,
      required String iconName,
      required String iconColor}) async {
    if (!(await checkIfUserExists(emailID: emailID, name: name))) {
      return await _userCollection.doc(emailID + seperator + name).set({
        'emailID': emailID,
        'name': name,
        'iconName': iconName,
        'iconColor': iconColor
      }, SetOptions(merge: true));
    }
    return null;
  }

  @override
  Future updateUser(
      {required String emailID,
      required String name,
      required String iconName,
      required String iconColor}) async {
    if (await checkIfUserExists(emailID: emailID, name: name)) {
      deleteUser(emailID: emailID, name: name);
      insertUser(
          emailID: emailID,
          name: name,
          iconName: iconName,
          iconColor: iconColor);
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

    return stream.map((qShot) => qShot.docs
        .map((doc) => UserModel(doc.get('emailID'), doc.get('name'), false,
            doc.get('iconName'), doc.get('iconColor')))
        .toList());
  }

  @override
  Stream getUser({required String emailID, required String name}) {
    return _userCollection
        .where('emailID', isEqualTo: emailID)
        .where('name', isEqualTo: name)
        .snapshots();
  }

  //ActionDate:
  @override
  Stream<List<ActionDateModel>> getAllActionDates({required String emailID}) {
    Stream<QuerySnapshot> stream =
        _actionDateCollection.where('emailID', isEqualTo: emailID).snapshots();

    return stream.map((qShot) => qShot.docs
        .map((doc) => ActionDateModel(
              doc.get('emailID'),
              doc.get('title'),
              doc.get('description'),
              doc.get('begin'),
              doc.get('end'),
              doc.get('users'),
              doc.get('dogs'),
            ))
        .toList());
  }
}
