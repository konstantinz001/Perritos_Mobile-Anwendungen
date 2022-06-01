import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-editable-profile.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSelectionAndAdministrationView extends ConsumerWidget {
  const UserSelectionAndAdministrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Geht nicht wahrscheinlich in Model einbauen. Muss mich da noch einlesen.
    bool editable = false;

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
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  icon: const Icon(PerritosIcons.Icon_Edit),
                                  tooltip: 'Bearbeiten',
                                  iconSize: 26,
                                  onPressed: () => {
                                        controller
                                            .switchCurrentUserSelectionAndAdministrationScreen(
                                                UserSelectionAndAdministration
                                                    .edit)
                                      })),
                          const SizedBox(height: 60),
                          PerritosProfile(
                              icon: PerritosIcons.Icon_User,
                              label: 'Dad',
                              edit: editable,
                              onPressed: () => {
                                    controller
                                        .switchCurrentUserSelectionAndAdministrationScreen(
                                            UserSelectionAndAdministration
                                                .select)
                                  }),
                          const SizedBox(height: 20),
                          PerritosProfile(
                              icon: PerritosIcons.Icon_User,
                              label: 'Mum',
                              edit: false,
                              onPressed: () => {
                                    controller
                                        .switchCurrentUserSelectionAndAdministrationScreen(
                                            UserSelectionAndAdministration
                                                .select)
                                  }),
                          const SizedBox(height: 20),
                          IconButton(
                              icon: const Icon(PerritosIcons.Icon_Add),
                              tooltip: 'Hinzufügen',
                              iconSize: 42,
                              onPressed: () => {
                                    controller
                                        .switchCurrentUserSelectionAndAdministrationScreen(
                                            UserSelectionAndAdministration.add)
                                  }),
                        ],
                      )))
              : model.currentUserSelectionAndAdministrationScreen ==
                      UserSelectionAndAdministration.edit
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
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      icon: const Icon(
                                          PerritosIcons.Icon_Arrow_Left),
                                      tooltip: 'Bearbeiten',
                                      iconSize: 26,
                                      onPressed: () => {
                                            controller
                                                .switchCurrentUserSelectionAndAdministrationScreen(
                                                    UserSelectionAndAdministration
                                                        .kickoff)
                                          })),
                              const SizedBox(height: 60),
                              PerritosProfile(
                                  icon: PerritosIcons.Icon_User,
                                  label: 'Dad',
                                  edit: true,
                                  onPressed: () => {
                                        controller
                                            .switchCurrentUserSelectionAndAdministrationScreen(
                                                UserSelectionAndAdministration
                                                    .select)
                                      }),
                              const SizedBox(height: 20),
                              PerritosProfile(
                                  icon: PerritosIcons.Icon_Edit,
                                  label: 'Mum',
                                  edit: true,
                                  onPressed: () => {
                                        controller
                                            .switchCurrentUserSelectionAndAdministrationScreen(
                                                UserSelectionAndAdministration
                                                    .select)
                                      }),
                              const SizedBox(height: 20),
                            ],
                          )))
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
}
