import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_selection_and_administration_model.freezed.dart';

enum UserSelectionAndAdministration { kickoff, edit, add, select }

@freezed
class UserSelectionAndAdministrationModel
    with _$UserSelectionAndAdministrationModel {
  const factory UserSelectionAndAdministrationModel({
    required UserSelectionAndAdministration
        currentUserSelectionAndAdministrationScreen,
  }) = _UserSelectionAndAdministrationModel;
}
