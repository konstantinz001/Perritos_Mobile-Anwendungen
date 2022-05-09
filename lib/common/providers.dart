import 'package:flutter_application/screens/userprofil/userprofil_view.dart';
import 'package:flutter_application/screens/userprofil/userprofil_model.dart';
import 'package:flutter_application/screens/userprofil/userprofil_controller.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_controller.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<RegistrationAndLoginController,
          RegistrationAndLoginModel> registrationAndLoginControllerProvider =
      StateNotifierProvider<RegistrationAndLoginController,
              RegistrationAndLoginModel>(
          (StateNotifierProviderRef ref) =>
              RegistrationAndLoginImplmentation());

  final StateNotifierProvider<UserProfilController, UserProfilModel>
      userProfilControllerProvider =
      StateNotifierProvider<UserProfilController, UserProfilModel>(
          (StateNotifierProviderRef ref) => UserProfilImplmentation());
}
