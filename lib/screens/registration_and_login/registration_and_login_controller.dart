import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/common/services/auth_service.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';

import '../../models/auth_user_model.dart';

enum RegistrationMessage { success, error, passwordsNotEqual }

class RegistrationAndLoginImplmentation extends RegistrationAndLoginController {
  final AuthService _authService;

  RegistrationAndLoginImplmentation({
    RegistrationAndLoginModel? model,
    required AuthService authService,
  })  : _authService = authService,
        super(model ??
            const RegistrationAndLoginModel(
                currentRegistrationAndLoginScreen: RegistrationAndLogin.kickoff,
                password: '',
                confirmPassword: '',
                email: ''));

  @override
  void changeState(screen, password, confirmPassword, email) {
    state = state.copyWith(
        currentRegistrationAndLoginScreen: screen,
        password: password,
        confirmPassword: confirmPassword,
        email: email);
  }

  Future<RegistrationMessage> register(password, confirmPassword, email) async {
    print(password);
    print(confirmPassword);
    print(email);
    if (password == confirmPassword) {
      dynamic result =
          await _authService.register(email: email, password: password);
      if (result == null) {
        return Future.delayed(
            const Duration(seconds: 1), () => RegistrationMessage.error);
      }
      return Future.delayed(
          const Duration(seconds: 1), () => RegistrationMessage.success);
    }
    return Future.delayed(const Duration(seconds: 1),
        () => RegistrationMessage.passwordsNotEqual);
  }

  Future<bool> login(password, email) async {
    dynamic result = await _authService.login(email: email, password: password);
    if (result == null) {
      return Future.delayed(const Duration(seconds: 3), () => false);
    }
    return Future.delayed(const Duration(seconds: 3), () => true);
  }
}
