import 'package:flutter_application/models/userDataModel.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';

const List<UserModel> UserList = [
  const UserModel("Mom", false),
  const UserModel("Dad", false),
  const UserModel("Lisa", false)
];

class UserSelectionAndAdministrationImplmentation
    extends UserSelectionAndAdministrationController {
  UserSelectionAndAdministrationImplmentation({
    UserSelectionAndAdministrationModel? model,
  }) : super(model ??
            const UserSelectionAndAdministrationModel(
                currentUserSelectionAndAdministrationScreen:
                    UserSelectionAndAdministration.kickoff,
                userList: UserList,
                editable: false));

  @override
  void switchCurrentUserSelectionAndAdministrationScreen(screen) {
    state = state.copyWith(currentUserSelectionAndAdministrationScreen: screen);
  }

  @override
  void addUser(usermodel) {
    state = state.copyWith(
        userList: new List.from(state.userList.toList())..insert(0, usermodel));
  }

  void changeEditability() {
    state = state.copyWith(editable: state.editable == true ? false : true);
  }

  void changeSelectedUser(UserModel userModel) {
    state = state.copyWith(
        userList: new List.from(state.userList.toList())
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
            userList: new List.from(state.userList.toList())
              ..insert(
                  state.userList
                      .toList()
                      .indexWhere((element) => element.name == user.name),
                  UserModel(user.name, false))
              ..removeAt(state.userList
                      .toList()
                      .indexWhere((element) => element.selected == true) +
                  1));
      }
    }
  }
}
