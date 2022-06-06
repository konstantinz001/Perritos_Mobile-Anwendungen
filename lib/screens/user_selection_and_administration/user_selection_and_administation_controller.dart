import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';

class UserSelectionAndAdministrationImplmentation
    extends UserSelectionAndAdministrationController {
  final List<UserModel> _users;
  final DatabaseService _databaseService;

  UserSelectionAndAdministrationImplmentation(
      {required List<UserModel> users,
      required DatabaseService databaseService,
      UserSelectionAndAdministrationModel? model})
      : _users = users,
        _databaseService = databaseService,
        super(model ??
            UserSelectionAndAdministrationModel(
              currentUserSelectionAndAdministrationScreen:
                  UserSelectionAndAdministration.kickoff,
              userList: users,
              editable: false,
            ));

  void switchCurrentUserSelectionAndAdministrationScreen(screen) {
    state = state.copyWith(currentUserSelectionAndAdministrationScreen: screen);
  }

  Future<void> addUser(UserModel userModel) async {
    _databaseService.insertUser(
        emailID: userModel.emailID, name: userModel.name);
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> setUserList(String email) async {
    state = state.copyWith(userList: List.from(await loadUsers(email)));
    await Future.delayed(const Duration(seconds: 1));
  }

  void changeEditability() {
    state = state.copyWith(editable: state.editable == true ? false : true);
  }

  void changeSelectedUser(UserModel userModel) {
    state = state.copyWith(
        userList: List.from(state.userList.toList())
          ..removeAt(state.userList
              .toList()
              .indexWhere((element) => element.name == userModel.name))
          ..insert(
              state.userList
                  .toList()
                  .indexWhere((element) => element.name == userModel.name),
              userModel));
  }

  UserModel getSelectedUser() {
    int index = state.userList
        .toList()
        .indexWhere((element) => element.selected == true);
    return state.userList[index];
  }

  void disabledSelectedUser() {
    for (var user in state.userList) {
      if (user.selected == true) {
        int index = state.userList
            .toList()
            .indexWhere((element) => element.name == user.name);

        state = state.copyWith(
            userList: List.from(state.userList.toList())
              ..insert(
                  state.userList
                      .toList()
                      .indexWhere((element) => element.name == user.name),
                  UserModel(user.emailID, user.name, false))
              ..removeAt(state.userList
                      .toList()
                      .indexWhere((element) => element.selected == true) +
                  1));
      }
    }
  }

  @override
  Future<List<UserModel>> loadUsers(String email) async {
    await for (List<UserModel> tasks
        in _databaseService.getAllUsers(emailID: email)) {
      tasks.forEach((element) {
        print("C:" + element.name);
      });
      await Future.delayed(const Duration(seconds: 1));
      return tasks;
    }
    return List.empty();
  }
}
