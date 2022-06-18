import 'package:cloud_firestore/cloud_firestore.dart';

class ActionDateModel {
  final String actionID;
  final String emailID;
  final String title;
  final String description;
  final Timestamp begin;
  final Timestamp end;
  final List<dynamic> users;
  final List<dynamic> dogs;

  ActionDateModel(this.actionID, this.emailID, this.title, this.description,
      this.begin, this.end, this.users, this.dogs);
}
