import 'package:flutter_application/screens/userprofil/userprofil_model.dart';
import 'package:flutter_application/screens/userprofil/userprofil_view.dart';

class UserProfilImplmentation extends UserProfilController {
  UserProfilImplmentation({
    UserProfilModel? model,
  }) : super(model ??
            const UserProfilModel(currentUserProfilScreen: UserProfil.kickoff));

  @override
  void switchCurrentUserProfilScreen(screen) {
    state = state.copyWith(currentUserProfilScreen: screen);
  }
}
