import 'package:flutter_application/models/userDataModel.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';

const List<UserModel> UserList = [
  const UserModel("Mom"),
  const UserModel("Dad"),
  const UserModel("Lisa")
];

class UserSelectionAndAdministrationImplmentation
    extends UserSelectionAndAdministrationController {
  UserSelectionAndAdministrationImplmentation({
    UserSelectionAndAdministrationModel? model,
  }) : super(model ??
            const UserSelectionAndAdministrationModel(
                currentUserSelectionAndAdministrationScreen:
                    UserSelectionAndAdministration.kickoff,
                userList: UserList));

  @override
  void switchCurrentUserSelectionAndAdministrationScreen(screen) {
    state = state.copyWith(currentUserSelectionAndAdministrationScreen: screen);
  }

  @override
  void addUser(usermodel) {
    state = state.copyWith(userList: new List.from(UserList)..add(usermodel));
  }
}
