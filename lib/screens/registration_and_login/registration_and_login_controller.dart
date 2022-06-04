import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/common/services/auth_service.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';

import '../../models/auth_user_model.dart';

enum RegistrationMessage {
  success,
  error,
  passwordsNotEqual
}

class RegistrationAndLoginImplmentation extends RegistrationAndLoginController {
  final AuthService _authService;
  String email = '';
  String password = '';
  String confirmpassword = '';

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

  void setEmail(inputEmail) {
    email = inputEmail;
  }

  void setPassword(inputPassword) {
    password = inputPassword;
  }

  void setConfirmPassword(inputConfirmPassword) {
    confirmpassword = inputConfirmPassword;
  }

  void resetValues() {
    email = '';
    password = '';
    confirmpassword = '';
  }

  Future<RegistrationMessage> register() async {
    if (password == confirmpassword) {
      dynamic result =
          await _authService.register(email: email, password: password);
      resetValues();
      if (result == null) {
        return Future.delayed(const Duration(seconds: 1), () => RegistrationMessage.error);
      }
      return Future.delayed(const Duration(seconds: 1), () => RegistrationMessage.success);
    }
    return Future.delayed(const Duration(seconds: 1), () => RegistrationMessage.passwordsNotEqual);
  }

  Future<bool> login() async {
    dynamic result = await _authService.login(email: email, password: password);
    resetValues();
    if (result == null) {
      return Future.delayed(const Duration(seconds: 3), () => false);
    }
    return Future.delayed(const Duration(seconds: 3), () => true);
  }
}
