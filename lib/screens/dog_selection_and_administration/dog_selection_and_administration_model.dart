import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application/common/models/dog_model.dart';

part 'dog_selection_and_administration_model.freezed.dart';

enum DogSelectionAndAdministration {
  kickoff,
  edit,
  add,
  select,
  changeIconName,
  changeIconColor
}

@freezed
class DogSelectionAndAdministrationModel
    with _$DogSelectionAndAdministrationModel {
  const factory DogSelectionAndAdministrationModel(
      {required DogSelectionAndAdministration
          currentDogSelectionAndAdministrationScreen,
      required List<DogModel> dogList,
      required bool editable,
      required String dogName,
      required String iconName,
      required String iconColor,
      required String rasse,
      required String info,
      required Timestamp birthday}) = _DogSelectionAndAdministrationModel;
}
