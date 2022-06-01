import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';

class UserSelectionAndAdministrationImplmentation
    extends UserSelectionAndAdministrationController {
  UserSelectionAndAdministrationImplmentation({
    UserSelectionAndAdministrationModel? model,
  }) : super(model ??
            const UserSelectionAndAdministrationModel(
                currentUserSelectionAndAdministrationScreen:
                    UserSelectionAndAdministration.kickoff));

  @override
  void switchCurrentUserSelectionAndAdministrationScreen(screen) {
    state = state.copyWith(currentUserSelectionAndAdministrationScreen: screen);
  }
}
