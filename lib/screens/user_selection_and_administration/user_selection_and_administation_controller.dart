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
}
