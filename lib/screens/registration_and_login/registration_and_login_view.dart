import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-button.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-icon-button.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_txt_input.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_controller.dart';
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
      child: model.currentRegistrationAndLoginScreen ==
              RegistrationAndLogin.kickoff
          ? Container(
              color: PerritosColor.perritosSnow.color,
              child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 0,
                    right: 10,
                    bottom: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(
                        image: AssetImage(
                            'lib/assets/images/Perritos_Logo_1_Coloured.png'),
                        height: 227,
                      ),
                      const SizedBox(height: 60),
                      PerritosButton(
                          onPressed: () => {
                                controller.changeState(
                                    RegistrationAndLogin.login, "", "", "", "")
                              },
                          label: 'Login'),
                      const SizedBox(height: 20),
                      PerritosButton(
                          onPressed: () => {
                                controller.changeState(
                                    RegistrationAndLogin.registration,
                                    "",
                                    "",
                                    "",
                                    "")
                              },
                          label: 'Sign Up'),
                      const SizedBox(height: 60),
                    ],
                  )))
          : model.currentRegistrationAndLoginScreen ==
                  RegistrationAndLogin.registration
              ? Container(
                  color: PerritosColor.perritosSnow.color,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 10,
                        bottom: 0,
                      ),
                      child: Column(children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Expanded(
                                  child: PerritosIconButton(
                                      onPressed: () => {
                                            controller.changeState(
                                                RegistrationAndLogin.kickoff,
                                                "",
                                                "",
                                                "",
                                                "")
                                          },
                                      iconSize: 40,
                                      icon: PerritosIcons.Icon_Arrow_Left)),
                              Text(
                                'Willkommen!',
                                style: perritosDoubleParagon,
                              ),
                              const Spacer()
                            ]),
                        Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              const SizedBox(height: 40),
                              PerritosTxtInput(
                                onSubmit: (value) => {
                                  controller.changeState(
                                      model.currentRegistrationAndLoginScreen,
                                      model.password,
                                      model.confirmPassword,
                                      model.email,
                                      value)
                                },
                                hintTxt: "Username",
                              ),
                              PerritosTxtInput(
                                onSubmit: (value) => {
                                  controller.changeState(
                                      model.currentRegistrationAndLoginScreen,
                                      model.password,
                                      model.confirmPassword,
                                      value,
                                      model.username)
                                },
                                hintTxt: "E-Mail Adresse",
                              ),
                              PerritosTxtInput(
                                onSubmit: (value) => {
                                  controller.changeState(
                                      model.currentRegistrationAndLoginScreen,
                                      value,
                                      model.confirmPassword,
                                      model.email,
                                      model.username)
                                },
                                hintTxt: "Passwort",
                                password: true,
                              ),
                              PerritosTxtInput(
                                onSubmit: (value) => {
                                  controller.changeState(
                                      model.currentRegistrationAndLoginScreen,
                                      model.password,
                                      value,
                                      model.email,
                                      model.username)
                                },
                                hintTxt: "Passwort bestätigen",
                                password: true,
                              ),
                            ],
                          )),
                        ),
                        PerritosButton(
                            onPressed: () async => {
                                  await (controller
                                      .register(
                                          model.password,
                                          model.confirmPassword,
                                          model.email,
                                          model.username)
                                      .then((message) => message ==
                                              RegistrationMessage.success
                                          ? {
                                              controller.changeState(
                                                  RegistrationAndLogin.kickoff,
                                                  model.password,
                                                  model.confirmPassword,
                                                  model.email,
                                                  model.username),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Registrierung war erfolgreich!',
                                                          style:
                                                              perritosDoublePica),
                                                      backgroundColor:
                                                          perritosGoldFusion))
                                            }
                                          : message == RegistrationMessage.error
                                              ? {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Registrierung war nicht erfolgreich! Versuche mit einer anderen E-Mail oder einem anderen Passwort.',
                                                              style:
                                                                  perritosDoublePica),
                                                          backgroundColor:
                                                              perritosBurntSienna))
                                                }
                                              : {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Passwörter stimmen nicht überein!',
                                                              style:
                                                                  perritosDoublePica),
                                                          backgroundColor:
                                                              perritosBurntSienna))
                                                }))
                                },
                            label: 'Sign Up'),
                        const SizedBox(height: 60)
                      ])))
              : Container(
                  color: PerritosColor.perritosSnow.color,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 10,
                      bottom: 0,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                                child: PerritosIconButton(
                                    onPressed: () => {
                                          controller.changeState(
                                              RegistrationAndLogin.kickoff,
                                              "",
                                              "",
                                              "",
                                              "")
                                        },
                                    iconSize: 40,
                                    icon: PerritosIcons.Icon_Arrow_Left)),
                            Text(
                              'Willkommen zurück!',
                              style: perritosDoubleParagon,
                              textAlign: TextAlign.center,
                            ),
                            const Spacer()
                          ],
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Column(
                          children: [
                            const SizedBox(height: 36),
                            PerritosTxtInput(
                              onSubmit: (value) => {
                                controller.changeState(
                                    model.currentRegistrationAndLoginScreen,
                                    model.password,
                                    model.confirmPassword,
                                    value,
                                    model.username)
                              },
                              hintTxt: "E-Mail Adresse",
                            ),
                            PerritosTxtInput(
                              onSubmit: (value) => {
                                controller.changeState(
                                    model.currentRegistrationAndLoginScreen,
                                    value,
                                    model.confirmPassword,
                                    model.email,
                                    model.username)
                              },
                              hintTxt: "Passwort",
                              password: true,
                            ),
                          ],
                        ))),
                        PerritosButton(
                            onPressed: () async => {
                                  await (controller
                                      .login(model.password, model.email)
                                      .then((users) => users
                                          ? {
                                              (controller
                                                  .loadUsers(model.email)
                                                  .then((userlist) => {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/UserSelectionAndAdministration',
                                                            arguments: {
                                                              'emailID':
                                                                  model.email,
                                                              'userList':
                                                                  userlist
                                                            })
                                                      }))
                                            }
                                          : {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Falsche E-Mail oder falsches Passwort!',
                                                          style:
                                                              perritosDoublePica),
                                                      backgroundColor:
                                                          perritosBurntSienna))
                                            }))
                                },
                            label: 'Login'),
                        const SizedBox(height: 60)
                      ],
                    ),
                  )),
    ));
  }
}

abstract class RegistrationAndLoginController
    extends StateNotifier<RegistrationAndLoginModel> {
  RegistrationAndLoginController(RegistrationAndLoginModel state)
      : super(state);

  void changeState(screen, password, confirmPassword, email, username);
  Future<RegistrationMessage> register(
      password, confirmPassword, email, username);
  Future<bool> login(password, email);
  Future<List<UserModel>> loadUsers(String email);
}
