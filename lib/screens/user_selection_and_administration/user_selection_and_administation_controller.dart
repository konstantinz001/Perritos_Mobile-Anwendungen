import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';

class UserSelectionAndAdministrationImplmentation
    extends UserSelectionAndAdministrationController {

  UserSelectionAndAdministrationImplmentation(
      {required List<UserModel> users,
      UserSelectionAndAdministrationModel? model})
      : super(model ??
            UserSelectionAndAdministrationModel(
              currentUserSelectionAndAdministrationScreen:
                  UserSelectionAndAdministration.kickoff,
              userList: users,
              editable: false,
            ));

  @override
  void switchCurrentUserSelectionAndAdministrationScreen(screen) {
    state = state.copyWith(currentUserSelectionAndAdministrationScreen: screen);
  }

  @override
  void addUser(usermodel) {
    state = state.copyWith(
        userList: List.from(state.userList.toList())..insert(0, usermodel));
  }

  @override
  void changeEditability() {
    state = state.copyWith(editable: state.editable == true ? false : true);
  }

  @override
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

  @override
  UserModel getSelectedUser() {
    int index = state.userList
        .toList()
        .indexWhere((element) => element.selected == true);
    return state.userList[index];
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
                  UserModel(user.emailID, user.name, false))
              ..removeAt(state.userList
                      .toList()
                      .indexWhere((element) => element.selected == true) +
                  1));
      }
    }
  }
}
