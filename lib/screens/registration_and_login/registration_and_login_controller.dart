import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';

class RegistrationAndLoginImplmentation extends RegistrationAndLoginController {

  RegistrationAndLoginImplmentation({RegistrationAndLoginModel? model,})
      : super(model ?? const RegistrationAndLoginModel(currentRegistrationAndLoginScreen: RegistrationAndLogin.kickoff));

  @override
  void switchCurrentRegistrationAndLoginScreen(screen) {
    state = state.copyWith(currentRegistrationAndLoginScreen: screen);
  }
}
