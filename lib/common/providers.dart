import 'package:flutter_application/screens/registration_and_login/registration_and_login_controller.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administation_controller.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/user_selection_and_administration/user_selection_and_administration_view.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<RegistrationAndLoginController,
          RegistrationAndLoginModel> registrationAndLoginControllerProvider =
      StateNotifierProvider<RegistrationAndLoginController,
              RegistrationAndLoginModel>(
          (StateNotifierProviderRef ref) =>
              RegistrationAndLoginImplmentation());

  final StateNotifierProvider<UserSelectionAndAdministrationController,
          UserSelectionAndAdministrationModel>
      userSelectionAndAdministrationControllerProvider = StateNotifierProvider<
              UserSelectionAndAdministrationController,
              UserSelectionAndAdministrationModel>(
          (StateNotifierProviderRef ref) =>
              UserSelectionAndAdministrationImplmentation());
}
