import 'package:cloud_firestore/cloud_firestore.dart';

class DogModel {
  final String emailID;
  final String name;
  bool selected;
  final String iconName;
  final String iconColor;
  final String breed;
  final Timestamp birthday;
  final String info;
  DogModel(
      this.emailID, 
      this.name, 
      this.selected, 
      this.iconName, 
      this.iconColor,
      this.breed,
      this.birthday,
      this.info
  );
}
