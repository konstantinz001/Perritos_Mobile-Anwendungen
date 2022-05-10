import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-button.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationAndLoginView extends ConsumerWidget {
  const RegistrationAndLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegistrationAndLoginController controller =
        ref.read(providers.registrationAndLoginControllerProvider.notifier);
    final RegistrationAndLoginModel model =
        ref.watch(providers.registrationAndLoginControllerProvider);

    return Scaffold(

      body: Center(
        child:
            model.currentRegistrationAndLoginScreen ==
                    RegistrationAndLogin.kickoff
                ? 
                Container(
                  color: PerritosColor.perritosSnow.color,
                  child: 
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 10,
                        bottom: 0,
                      ),
                      child:
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Image(
                                image: AssetImage('lib/assets/images/Perritos_Logo_1_Coloured.png'),
                                height: 227,
                              ),
                              const SizedBox(height: 60),
                              PerritosButton(onPressed: () => {controller.switchCurrentRegistrationAndLoginScreen(
                                          RegistrationAndLogin.login)}, label: 'Login'),
                              const SizedBox(height: 20),
                              PerritosButton(
                                onPressed: () => {controller.switchCurrentRegistrationAndLoginScreen(
                                          RegistrationAndLogin.registration)}, 
                                label: 'Sign Up'
                              ),
                              const SizedBox(height: 60),
                            ],
                        )
                    )
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
