import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/common/models/users/user_model.dart';
import 'package:flutter_application/screens/calendar/calendar_controller.dart';
import 'package:flutter_application/screens/calendar/calendar_model.dart';
import 'package:flutter_application/screens/calendar/calendar_view.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_controller.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_model.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_view.dart';
import 'package:flutter_application/screens/dog_selection_and_administration/dog_selection_and_administation_controller.dart';
import 'package:flutter_application/screens/dog_selection_and_administration/dog_selection_and_administration_model.dart';
import 'package:flutter_application/screens/dog_selection_and_administration/dog_selection_and_administration_view.dart';
import 'package:flutter_application/screens/home/home_controller.dart';
import 'package:flutter_application/screens/home/home_model.dart';
import 'package:flutter_application/screens/home/home_view.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_controller.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/common/services/auth_service.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administation_controller.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import '../screens/dog_profile_info/dog_profile_info_model.dart';
import 'models/users/dog_model.dart';

final Providers providers = Providers();

class Providers {
  final Provider<AuthService> authServiceProvider =
      Provider<AuthService>((ProviderRef ref) => AuthFirebaseService());

  final Provider<DatabaseService> databaseServiceProvider =
      Provider<DatabaseService>(
          (ProviderRef ref) => DatabaseFireStoreService());

  final StateNotifierProvider<RegistrationAndLoginController,
          RegistrationAndLoginModel> registrationAndLoginControllerProvider =
      StateNotifierProvider<RegistrationAndLoginController,
              RegistrationAndLoginModel>(
          (StateNotifierProviderRef ref) => RegistrationAndLoginImplmentation(
              databaseService: ref.read(providers.databaseServiceProvider),
              authService: ref.read(providers.authServiceProvider)));

  final StateNotifierProviderFamily<
          UserSelectionAndAdministrationController,
          UserSelectionAndAdministrationModel,
          List<UserModel>> userSelectionAndAdministrationControllerProvider =
      StateNotifierProvider.family<
          UserSelectionAndAdministrationController,
          UserSelectionAndAdministrationModel,
          List<UserModel>>((StateNotifierProviderRef ref,
              List<UserModel> data) =>
          UserSelectionAndAdministrationImplmentation(
              users: data,
              databaseService: ref.read(providers.databaseServiceProvider)));

  final StateNotifierProviderFamily<
          DogSelectionAndAdministrationController,
          DogSelectionAndAdministrationModel,
          List<DogModel>> dogSelectionAndAdministrationControllerProvider =
      StateNotifierProvider.family<
          DogSelectionAndAdministrationController,
          DogSelectionAndAdministrationModel,
          List<DogModel>>((StateNotifierProviderRef ref,
              List<DogModel> data) =>
          DogSelectionAndAdministrationImplmentation(
              dogs: data,
              databaseService: ref.read(providers.databaseServiceProvider)));

  final StateNotifierProvider<CalendarController, CalendarModel>
      calendarControllerProvider =
      StateNotifierProvider<CalendarController, CalendarModel>(
          (StateNotifierProviderRef ref) => CalendarImplmentation(
              databaseService: ref.read(providers.databaseServiceProvider)));

  final StateNotifierProviderFamily<HomeController, HomeModel, Tuple3>
      homeControllerProvider =
      StateNotifierProvider.family<HomeController, HomeModel, Tuple3>(
          (StateNotifierProviderRef ref, Tuple3 data) => HomeImplmentation(
              userName: data.item1,
              dogName: data.item2,
              dateModel: data.item3,
              databaseService: ref.read(providers.databaseServiceProvider)));

  final StateNotifierProviderFamily<DogProfileInfoController, DogProfileModel,
      DogModel> dogProfileInfoControllerProvider = StateNotifierProvider.family<
          DogProfileInfoController, DogProfileModel, DogModel>(
      (StateNotifierProviderRef ref, DogModel data) =>
          DogProfileInfoImplementation(
              databaseService: ref.read(providers.databaseServiceProvider),
              dog: data,));
}
