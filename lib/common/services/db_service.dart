import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/common/models/action_abnormality_model.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'package:flutter_application/common/models/action_task_model.dart';
import 'package:flutter_application/common/models/action_walking_model.dart';
import 'package:flutter_application/common/models/user_model.dart';
import 'package:flutter_application/common/models/dog_model.dart';

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
      required String newName,
      required String iconName,
      required String newIconName,
      required String iconColor,
      required String newIconColor});
  Future deleteUser({
    required String emailID,
    required String name,
  });
  Future checkIfUserExists({
    required String emailID,
    required String name,
  });
  Future<List<UserModel>> getAllUsers({required String emailID});
  Stream getUser({required String emailID, required String name});

  //Dog:
  Stream<List<DogModel>> getAllDogs({required String emailID});

  //ActionDate:
  Stream getAllActionDates({required String emailID});
  Future<ActionDateModel> getActionDateWithID({required String actionID});
  Future deleteActionDateWithID({required String actionID});
  Future updateActionDateWithID(
      {required String actionID,
      required String title,
      required String description,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs});
  Future insertActionDate(
      {required String emailID,
      required String title,
      required String description,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs});

  //ActionAbnormality:
  Stream getAllActionAbnormalities({required String emailID});
  Future<ActionAbnormalityModel> getActionAbnormalityWithID(
      {required String actionID});
  Future deleteActionAbnormalityWithID({required String actionID});
  Future updateActionAbnormalityWithID(
      {required String actionID,
      required String title,
      required String description,
      required String dog,
      required int emotionalState});
  Future insertActionAbnormaility(
      {required String emailID,
      required String title,
      required String description,
      required String dog,
      required int emotionalState});

  //ActionTask:
  Stream getAllActionTasks({required String emailID});
  Future<ActionTaskModel> getActionTaskWithID({required String actionID});
  Future deleteActionTaskWithID({required String actionID});
  Future updateActionTaskWithID(
      {required String actionID,
      required String title,
      required String description,
      required List<dynamic> users,
      required List<dynamic> dogs});
  Future insertActionTask(
      {required String emailID,
      required String title,
      required String description,
      required List<dynamic> users,
      required List<dynamic> dogs});

  //ActionWalking:
  Stream getAllActionWalkings({required String emailID});
  Future<ActionWalkingModel> getActionWalkingWithID({required String actionID});
  Future deleteActionWalkingWithID({required String actionID});
  Future updateActionWalkingWithID(
      {required String actionID,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs});
  Future insertActionWalking(
      {required String emailID,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs});
}

class DatabaseFireStoreService extends DatabaseService {
  // collection reference
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _dogCollection =
      FirebaseFirestore.instance.collection('dogs');

  final CollectionReference _actionDateCollection =
      FirebaseFirestore.instance.collection('actionDates');

  final CollectionReference _actionAbnormalityCollection =
      FirebaseFirestore.instance.collection('actionAbnormalities');

  final CollectionReference _actionTaskCollection =
      FirebaseFirestore.instance.collection('actionTasks');

  final CollectionReference _actionWalkingCollection =
      FirebaseFirestore.instance.collection('actionWalkings');

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
      required String newName,
      required String iconName,
      required String newIconName,
      required String iconColor,
      required String newIconColor}) async {
    if (await checkIfUserExists(emailID: emailID, name: name)) {
      await deleteUser(emailID: emailID, name: name);

      await insertUser(
          emailID: emailID,
          name: newName,
          iconName: newIconName,
          iconColor: newIconColor);
    }
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
  Future<List<UserModel>> getAllUsers({required String emailID}) {
    Stream<QuerySnapshot> stream =
        _userCollection.where('emailID', isEqualTo: emailID).snapshots();

    final Completer<List<UserModel>> c = Completer<List<UserModel>>();
    stream.listen((event) {
      c.complete(event.docs
          .map((doc) => UserModel(
                doc.get('emailID'),
                doc.get('name'),
                false,
                doc.get('iconName'),
                doc.get('iconColor'),
              ))
          .toList());
    });
    return c.future;
  }

  @override
  Stream getUser({required String emailID, required String name}) {
    return _userCollection
        .where('emailID', isEqualTo: emailID)
        .where('name', isEqualTo: name)
        .snapshots();
  }

  //Dog:
  @override
  Stream<List<DogModel>> getAllDogs({required String emailID}) {
    Stream<QuerySnapshot> stream =
        _dogCollection.where('emailID', isEqualTo: emailID).snapshots();

    return stream.map((qShot) => qShot.docs
        .map((doc) => DogModel(
            doc.get('emailID'),
            doc.get('name'),
            false,
            doc.get('iconName'),
            doc.get('iconColor'),
            doc.get('breed'),
            doc.get('birthday'),
            doc.get('info')))
        .toList());
  }

  //ActionDate:
  @override
  Stream<List<ActionDateModel>> getAllActionDates({required String emailID}) {
    Stream<QuerySnapshot> stream =
        _actionDateCollection.where('emailID', isEqualTo: emailID).snapshots();

    return stream.map((qShot) => qShot.docs
        .map((doc) => ActionDateModel(
              doc.id,
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

  @override
  Future<ActionDateModel> getActionDateWithID(
      {required String actionID}) async {
    DocumentSnapshot<Object?> doc =
        await _actionDateCollection.doc(actionID).get();
    return ActionDateModel(
      actionID,
      doc.get('emailID'),
      doc.get('title'),
      doc.get('description'),
      doc.get('begin'),
      doc.get('end'),
      doc.get('users'),
      doc.get('dogs'),
    );
  }

  @override
  Future deleteActionDateWithID({required String actionID}) async {
    await _actionDateCollection.doc(actionID).delete();
  }

  @override
  Future updateActionDateWithID(
      {required String actionID,
      required String title,
      required String description,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs}) async {
    await _actionDateCollection.doc(actionID).update({
      'title': title,
      'description': description,
      'begin': begin,
      'end': end,
      'users': users,
      'dogs': dogs
    });
  }

  @override
  Future insertActionDate(
      {required String emailID,
      required String title,
      required String description,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs}) async {
    await _actionDateCollection.doc().set({
      'emailID': emailID,
      'title': title,
      'description': description,
      'begin': begin,
      'end': end,
      'users': users,
      'dogs': dogs
    });
  }

  //ActionAbnormality:
  @override
  Stream<List<ActionAbnormalityModel>> getAllActionAbnormalities(
      {required String emailID}) {
    Stream<QuerySnapshot> stream = _actionAbnormalityCollection
        .where('emailID', isEqualTo: emailID)
        .snapshots();

    return stream.map((qShot) => qShot.docs
        .map((doc) => ActionAbnormalityModel(
              doc.id,
              doc.get('emailID'),
              doc.get('title'),
              doc.get('description'),
              doc.get('dog'),
              doc.get('emotionalState'),
            ))
        .toList());
  }

  @override
  Future<ActionAbnormalityModel> getActionAbnormalityWithID(
      {required String actionID}) async {
    DocumentSnapshot<Object?> doc =
        await _actionAbnormalityCollection.doc(actionID).get();
    return ActionAbnormalityModel(
        actionID,
        doc.get('emailID'),
        doc.get('title'),
        doc.get('description'),
        doc.get('dog'),
        doc.get('emotionalState'));
  }

  @override
  Future deleteActionAbnormalityWithID({required String actionID}) async {
    await _actionAbnormalityCollection.doc(actionID).delete();
  }

  @override
  Future updateActionAbnormalityWithID(
      {required String actionID,
      required String title,
      required String description,
      required String dog,
      required int emotionalState}) async {
    await _actionAbnormalityCollection.doc(actionID).update({
      'title': title,
      'description': description,
      'dog': dog,
      'emotionalState': emotionalState
    });
  }

  @override
  Future insertActionAbnormaility(
      {required String emailID,
      required String title,
      required String description,
      required String dog,
      required int emotionalState}) async {
    await _actionAbnormalityCollection.doc().set({
      'emailID': emailID,
      'title': title,
      'description': description,
      'dog': dog,
      'emotionalState': emotionalState
    });
  }

  //ActionTask:
  @override
  Stream<List<ActionTaskModel>> getAllActionTasks({required String emailID}) {
    Stream<QuerySnapshot> stream =
        _actionTaskCollection.where('emailID', isEqualTo: emailID).snapshots();

    return stream.map((qShot) => qShot.docs
        .map((doc) => ActionTaskModel(
              doc.id,
              doc.get('emailID'),
              doc.get('title'),
              doc.get('description'),
              doc.get('users'),
              doc.get('dogs'),
            ))
        .toList());
  }

  @override
  Future<ActionTaskModel> getActionTaskWithID(
      {required String actionID}) async {
    DocumentSnapshot<Object?> doc =
        await _actionTaskCollection.doc(actionID).get();
    return ActionTaskModel(
      actionID,
      doc.get('emailID'),
      doc.get('title'),
      doc.get('description'),
      doc.get('users'),
      doc.get('dogs'),
    );
  }

  @override
  Future deleteActionTaskWithID({required String actionID}) async {
    await _actionTaskCollection.doc(actionID).delete();
  }

  @override
  Future updateActionTaskWithID(
      {required String actionID,
      required String title,
      required String description,
      required List<dynamic> users,
      required List<dynamic> dogs}) async {
    await _actionTaskCollection.doc(actionID).update({
      'title': title,
      'description': description,
      'users': users,
      'dogs': dogs
    });
  }

  @override
  Future insertActionTask(
      {required String emailID,
      required String title,
      required String description,
      required List<dynamic> users,
      required List<dynamic> dogs}) async {
    await _actionTaskCollection.doc().set({
      'emailID': emailID,
      'title': title,
      'description': description,
      'users': users,
      'dogs': dogs
    });
  }

  //ActionWalking:
  @override
  Stream<List<ActionWalkingModel>> getAllActionWalkings(
      {required String emailID}) {
    Stream<QuerySnapshot> stream = _actionWalkingCollection
        .where('emailID', isEqualTo: emailID)
        .snapshots();

    return stream.map((qShot) => qShot.docs
        .map((doc) => ActionWalkingModel(
              doc.id,
              doc.get('emailID'),
              doc.get('begin'),
              doc.get('end'),
              doc.get('users'),
              doc.get('dogs'),
            ))
        .toList());
  }

  @override
  Future<ActionWalkingModel> getActionWalkingWithID(
      {required String actionID}) async {
    DocumentSnapshot<Object?> doc =
        await _actionWalkingCollection.doc(actionID).get();
    return ActionWalkingModel(
      actionID,
      doc.get('emailID'),
      doc.get('begin'),
      doc.get('end'),
      doc.get('users'),
      doc.get('dogs'),
    );
  }

  @override
  Future deleteActionWalkingWithID({required String actionID}) async {
    await _actionWalkingCollection.doc(actionID).delete();
  }

  @override
  Future updateActionWalkingWithID(
      {required String actionID,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs}) async {
    await _actionWalkingCollection
        .doc(actionID)
        .update({'begin': begin, 'end': end, 'users': users, 'dogs': dogs});
  }

  @override
  Future insertActionWalking(
      {required String emailID,
      required Timestamp begin,
      required Timestamp end,
      required List<dynamic> users,
      required List<dynamic> dogs}) async {
    await _actionWalkingCollection.doc().set({
      'emailID': emailID,
      'begin': begin,
      'end': end,
      'users': users,
      'dogs': dogs
    });
  }
}
