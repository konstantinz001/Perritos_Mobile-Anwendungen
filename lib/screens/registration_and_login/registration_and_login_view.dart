import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-button.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationAndLoginView extends ConsumerWidget {
  const RegistrationAndLoginView({Key? key}) : super(key: key);

  Widget get registration =>
      PerritosButton(onPressed: () => {print('button')}, label: 'Registration');

  Widget get login =>
      PerritosButton(onPressed: () => {print('button')}, label: 'Login');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegistrationAndLoginController controller =
        ref.read(providers.registrationAndLoginControllerProvider.notifier);
    final RegistrationAndLoginModel model =
        ref.watch(providers.registrationAndLoginControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            model.currentRegistrationAndLoginScreen ==
                    RegistrationAndLogin.kickoff
                ? Column(
                    children: [
                      PerritosButton(onPressed: () => {controller.switchCurrentRegistrationAndLoginScreen(
                                  RegistrationAndLogin.login)}, label: 'Login'),
                      const SizedBox(height: 20),
                      PerritosButton(
                        onPressed: () => {controller.switchCurrentRegistrationAndLoginScreen(
                                  RegistrationAndLogin.registration)}, 
                        label: 'Sign Up'
                      ),
                    ],
                )
                : model.currentRegistrationAndLoginScreen ==
                    RegistrationAndLogin.registration 
                ? Column(
                    children: [
                      Text(
                        'Welcome!',
                        style: perritosDoubleParagon,
                      ),
                      const SizedBox(height: 20),
                      PerritosButton(
                        onPressed: () => {print('Sign Up')}, 
                        label: 'Sign Up'
                      ),
                    ]
                ) : Column(
                    children: [
                      Text(
                        'Welcome back!',
                        style: perritosDoubleParagon,
                      ),
                      const SizedBox(height: 20),
                      PerritosButton(
                        onPressed: () => {print('Login')}, 
                        label: 'Login'
                      ),
                    ]
                ) 
          ],
        ),
      ),
    );
  }
}

abstract class RegistrationAndLoginController
    extends StateNotifier<RegistrationAndLoginModel> {
  RegistrationAndLoginController(RegistrationAndLoginModel state)
      : super(state);

  void switchCurrentRegistrationAndLoginScreen(screen);
}
