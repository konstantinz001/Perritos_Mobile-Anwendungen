import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_application/common/services/auth_service.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';

enum RegistrationMessage { success, error, passwordsNotEqual }

class RegistrationAndLoginImplmentation extends RegistrationAndLoginController {
  final AuthService _authService;
  final DatabaseService _databaseService;

  RegistrationAndLoginImplmentation({
    RegistrationAndLoginModel? model,
    required AuthService authService,
    required DatabaseService databaseService,
  })  : _authService = authService,
        _databaseService = databaseService,
        super(model ??
            const RegistrationAndLoginModel(
                currentRegistrationAndLoginScreen: RegistrationAndLogin.kickoff,
                password: '',
                confirmPassword: '',
                email: '',
                username: ''));

  @override
  void changeState(screen, password, confirmPassword, email, username) {
    state = state.copyWith(
        currentRegistrationAndLoginScreen: screen,
        password: password,
        confirmPassword: confirmPassword,
        email: email,
        username: username);
  }

  @override
  Future<RegistrationMessage> register(
      password, confirmPassword, email, username) async {
    if (password == confirmPassword) {
      dynamic result =
          await _authService.register(email: email, password: password);
      if (result == null) {
        return Future.delayed(
            const Duration(seconds: 1), () => RegistrationMessage.error);
      }
      _databaseService.insertUser(
        emailID: email, name: username);
      return Future.delayed(
          const Duration(seconds: 1), () => RegistrationMessage.success);
    }
    return Future.delayed(const Duration(seconds: 1),
        () => RegistrationMessage.passwordsNotEqual);
  }

  @override
  Future<bool> login(password, email) async {
    dynamic result = await _authService.login(email: email, password: password);
    if (result == null) {
      return Future.delayed(const Duration(seconds: 1), () => false);
    }
    return Future.delayed(const Duration(seconds: 1), () => true);
  }

  @override
  Future<List<UserModel>> loadUsers(String email) async {
    await for (List<UserModel> tasks
        in _databaseService.getAllUsers(emailID: email)) {
      return tasks;
    }
    return List.empty();
  }
}
