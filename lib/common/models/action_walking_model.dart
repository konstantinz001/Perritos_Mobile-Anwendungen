import 'package:cloud_firestore/cloud_firestore.dart';

class ActionWalkingModel {
  final String actionID;
  final String emailID;
  final Timestamp begin;
  final Timestamp end;
  final List<dynamic> users;
  final List<dynamic> dogs;

  ActionWalkingModel(
    this.actionID,
    this.emailID,
    this.begin,
    this.end,
    this.users,
    this.dogs
  );
}
