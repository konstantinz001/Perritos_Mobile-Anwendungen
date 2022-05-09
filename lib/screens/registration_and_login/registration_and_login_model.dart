import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_and_login_model.freezed.dart';

enum RegistrationAndLogin { kickoff, registration, login }

@freezed
class RegistrationAndLoginModel with _$RegistrationAndLoginModel {
  const factory RegistrationAndLoginModel({
    required RegistrationAndLogin currentRegistrationAndLoginScreen,
  }) = _RegistrationAndLoginModel;
}
