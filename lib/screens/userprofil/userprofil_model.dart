import 'package:freezed_annotation/freezed_annotation.dart';

part 'userprofil_model.freezed.dart';

enum UserProfil { kickoff, edit, add, select }

@freezed
class UserProfilModel with _$UserProfilModel {
  const factory UserProfilModel({
    required UserProfil currentUserProfilScreen,
  }) = _UserProfilModel;
}
