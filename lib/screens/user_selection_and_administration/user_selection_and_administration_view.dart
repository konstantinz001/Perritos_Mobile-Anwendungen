import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-editable-profile.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/models/userDataModel.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSelectionAndAdministrationView extends ConsumerWidget {
  const UserSelectionAndAdministrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Geht nicht wahrscheinlich in Model einbauen. Muss mich da noch einlesen.

    final UserSelectionAndAdministrationController controller = ref.read(
        providers.userSelectionAndAdministrationControllerProvider.notifier);
    final UserSelectionAndAdministrationModel model =
        ref.watch(providers.userSelectionAndAdministrationControllerProvider);

    return Scaffold(
      body: Center(
          child: model.currentUserSelectionAndAdministrationScreen ==
                  UserSelectionAndAdministration.kickoff
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20),
                            model.editable == false
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        icon:
                                            const Icon(PerritosIcons.Icon_Edit),
                                        tooltip: 'Bearbeiten',
                                        iconSize: 26,
                                        onPressed: () => {
                                              controller.changeEditability(),
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .kickoff)
                                            }))
                                : Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                        icon: const Icon(
                                            PerritosIcons.Icon_Arrow_Left),
                                        tooltip: 'Return',
                                        iconSize: 26,
                                        onPressed: () => {
                                              controller.changeEditability(),
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .kickoff)
                                            })),
                            const SizedBox(height: 60),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  for (var user in model.userList)
                                    Column(
                                      children: [
                                        PerritosProfile(
                                            icon: PerritosIcons.Icon_User,
                                            label: user.name,
                                            edit: model.editable,
                                            onPressed: () => {
                                                  controller
                                                      .switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .select)
                                                }),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                ]),
                              ),
                            ),
                            model.editable == false
                                ? (Align(
                                    alignment: Alignment.bottomCenter,
                                    child: IconButton(
                                        icon:
                                            const Icon(PerritosIcons.Icon_Add),
                                        tooltip: 'Hinzufügen',
                                        iconSize: 42,
                                        onPressed: () => {
                                              controller
                                                  .addUser(UserModel("Kira")),
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .kickoff)
                                            }),
                                  ))
                                : const SizedBox(height: 42),
                            const SizedBox(height: 20),
                          ])))
              : model.currentUserSelectionAndAdministrationScreen ==
                      UserSelectionAndAdministration.select
                  ? Column(children: [
                      Text(
                        'SELECTED USER!',
                        style: perritosDoubleParagon,
                      ),
                      const SizedBox(height: 20),
                    ])
                  : Column(children: [
                      Text(
                        'Welcome back!',
                        style: perritosDoubleParagon,
                      ),
                      const SizedBox(height: 20),
                    ])),
    );
  }
}

abstract class UserSelectionAndAdministrationController
    extends StateNotifier<UserSelectionAndAdministrationModel> {
  UserSelectionAndAdministrationController(
      UserSelectionAndAdministrationModel state)
      : super(state);

  void switchCurrentUserSelectionAndAdministrationScreen(screen);

  void addUser(UserModel userModel);

  void changeEditability();
}
