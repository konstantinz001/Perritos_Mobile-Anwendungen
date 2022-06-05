import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_controller.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/common/services/auth_service.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administation_controller.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../screens/user_selection_and_administration/user_selection_and_administration_view.dart';

final Providers providers = Providers();

class Providers {
  final Provider<AuthService> authServiceProvider =
      Provider<AuthService>((ProviderRef ref) => AuthFirebaseService());

  final StateNotifierProvider<RegistrationAndLoginController,
          RegistrationAndLoginModel> registrationAndLoginControllerProvider =
      StateNotifierProvider<RegistrationAndLoginController,
              RegistrationAndLoginModel>(
          (StateNotifierProviderRef ref) => RegistrationAndLoginImplmentation(
              authService: ref.read(providers.authServiceProvider)));

  final StateNotifierProviderFamily<
          UserSelectionAndAdministrationController,
          UserSelectionAndAdministrationModel,
          Tuple2> userSelectionAndAdministrationControllerProvider =
      StateNotifierProvider.family<UserSelectionAndAdministrationController,
              UserSelectionAndAdministrationModel, Tuple2>(
          (StateNotifierProviderRef ref, Tuple2 data) =>
              UserSelectionAndAdministrationImplmentation(
                  id: data.item1, users: data.item2));
}
