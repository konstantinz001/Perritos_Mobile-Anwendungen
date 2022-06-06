import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application/models/user_model.dart';

part 'user_selection_and_administration_model.freezed.dart';

enum UserSelectionAndAdministration {
  kickoff,
  edit,
  add,
  select,
  changeIconName,
  changeIconColor
}

@freezed
class UserSelectionAndAdministrationModel
    with _$UserSelectionAndAdministrationModel {
  const factory UserSelectionAndAdministrationModel(
      {required UserSelectionAndAdministration
          currentUserSelectionAndAdministrationScreen,
      required List<UserModel> userList,
      required bool editable,
      required String userName,
      required String iconName,
      required String iconColor}) = _UserSelectionAndAdministrationModel;
}
