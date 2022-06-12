import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/common/models/user_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';

class UserSelectionAndAdministrationImplmentation
    extends UserSelectionAndAdministrationController {
  final DatabaseService _databaseService;

  UserSelectionAndAdministrationImplmentation(
      {required List<UserModel> users,
      required DatabaseService databaseService,
      UserSelectionAndAdministrationModel? model})
      : _databaseService = databaseService,
        super(model ??
            UserSelectionAndAdministrationModel(
              currentUserSelectionAndAdministrationScreen:
                  UserSelectionAndAdministration.kickoff,
              userName: '',
              iconName: 'Icon_User',
              iconColor: 'perritosCharcoal',
              userList: users,
              editable: false,
            ));

  @override
  void switchCurrentUserSelectionAndAdministrationScreen(screen) {
    state = state.copyWith(currentUserSelectionAndAdministrationScreen: screen);
  }

  @override
  Future<void> addUser(UserModel userModel) async {
    await _databaseService.insertUser(
        emailID: userModel.emailID,
        name: userModel.name,
        iconName: userModel.iconName,
        iconColor: userModel.iconColor);
  }

  @override
  Future<void> deleteUser(UserModel userModel) async {
    await _databaseService.deleteUser(
        emailID: userModel.emailID, name: userModel.name);
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    var currentUserName = getSelectedUser()!;
    await _databaseService.updateUser(
      emailID: userModel.emailID,
      name: currentUserName.name,
      newName: userModel.name,
      iconName: currentUserName.name,
      newIconName: userModel.iconName,
      iconColor: userModel.iconColor,
      newIconColor: userModel.iconColor,
    );
  }

  @override
  void setEditingName(String name) {
    state = state.copyWith(userName: name);
  }

  @override
  void setEditingIconName(String iconName) {
    state = state.copyWith(iconName: iconName);
  }

  @override
  void setEditingIconColor(String iconColor) {
    state = state.copyWith(iconColor: iconColor);
  }

  @override
  void setEditingDefault() {
    setEditingName('');
    setEditingIconName('Icon_User');
    setEditingIconColor('perritosCharcoal');
  }

  @override
  void changeEditability() {
    state = state.copyWith(editable: state.editable == true ? false : true);
  }

  @override
  void changeSelectedUser(UserModel userModel) {
    int index =
        state.userList.indexWhere((element) => element.name == userModel.name);
    state = state.copyWith(
        userList: List.from(state.userList.toList())
          ..removeAt(index)
          ..insert(
              index,
              UserModel(userModel.emailID, userModel.name, true,
                  userModel.iconName, userModel.iconColor)));
  }

  @override
  UserModel? getSelectedUser() {
    int index = state.userList
        .toList()
        .indexWhere((element) => element.selected == true);

    if (index >= 0) {
      return state.userList[index];
    } else {
      return null;
    }
  }

  @override
  void disabledSelectedUser() {
    for (var user in state.userList) {
      if (user.selected == true) {
        state = state.copyWith(
            userList: List.from(state.userList.toList())
              ..insert(
                  state.userList
                      .toList()
                      .indexWhere((element) => element.name == user.name),
                  UserModel(user.emailID, user.name, false, user.iconName,
                      user.iconColor))
              ..removeAt(state.userList
                      .toList()
                      .indexWhere((element) => element.selected == true) +
                  1));
      }
    }
  }

  @override
  Future<List<UserModel>> loadUsers(String email) async {
    /*await for (List<UserModel> users
        in _databaseService.getAllUsers(emailID: email)) {
      return users.toList();
    }*/
    return await _databaseService.getAllUsers(emailID: email);
    //return List.empty();
  }
}
