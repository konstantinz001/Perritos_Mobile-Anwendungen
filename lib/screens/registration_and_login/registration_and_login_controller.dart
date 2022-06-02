import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/common/services/auth_service.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';

class RegistrationAndLoginImplmentation extends RegistrationAndLoginController {
  final AuthService _authService;

  RegistrationAndLoginImplmentation({
    RegistrationAndLoginModel? model,
    required AuthService authService,
  })  : _authService = authService,
        super(model ??
            const RegistrationAndLoginModel(
                currentRegistrationAndLoginScreen:
                    RegistrationAndLogin.kickoff));

  @override
  void switchCurrentRegistrationAndLoginScreen(screen) {
    state = state.copyWith(currentRegistrationAndLoginScreen: screen);
  }

  void register(username, email, password) {
    dynamic result = _authService.register(email: email, password: password);
    if (result == null) print("NOT WORKING");
  }
}
