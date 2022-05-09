import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-editable-profile.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/assets/styles/perritos-icons/perritos_icons.dart';
import 'package:flutter_application/screens/userprofil/userprofil_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfilView extends ConsumerWidget {
  const UserProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Geht nicht wahrscheinlich in Model einbauen. Muss mich da noch einlesen.
    bool editable = false;

    final UserProfilController controller =
        ref.read(providers.userProfilControllerProvider.notifier);
    final UserProfilModel model =
        ref.watch(providers.userProfilControllerProvider);

    return Scaffold(
      body: Center(
          child: model.currentUserProfilScreen == UserProfil.kickoff
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
                                            .switchCurrentUserProfilScreen(
                                                UserProfil.edit)
                                      })),
                          const SizedBox(height: 60),
                          PerritosProfile(
                              icon: PerritosIcons.Icon_User,
                              label: 'Dad',
                              edit: editable,
                              onPressed: () => {
                                    controller.switchCurrentUserProfilScreen(
                                        UserProfil.select)
                                  }),
                          const SizedBox(height: 20),
                          PerritosProfile(
                              icon: PerritosIcons.Icon_User,
                              label: 'Mum',
                              edit: false,
                              onPressed: () => {
                                    controller.switchCurrentUserProfilScreen(
                                        UserProfil.select)
                                  }),
                          const SizedBox(height: 20),
                          IconButton(
                              icon: const Icon(PerritosIcons.Icon_Add),
                              tooltip: 'Hinzufügen',
                              iconSize: 42,
                              onPressed: () => {
                                    controller.switchCurrentUserProfilScreen(
                                        UserProfil.add)
                                  }),
                        ],
                      )))
              : model.currentUserProfilScreen == UserProfil.edit
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
                                                .switchCurrentUserProfilScreen(
                                                    UserProfil.kickoff)
                                          })),
                              const SizedBox(height: 60),
                              PerritosProfile(
                                  icon: PerritosIcons.Icon_User,
                                  label: 'Dad',
                                  edit: true,
                                  onPressed: () => {
                                        controller
                                            .switchCurrentUserProfilScreen(
                                                UserProfil.select)
                                      }),
                              const SizedBox(height: 20),
                              PerritosProfile(
                                  icon: PerritosIcons.Icon_Edit,
                                  label: 'Mum',
                                  edit: true,
                                  onPressed: () => {
                                        controller
                                            .switchCurrentUserProfilScreen(
                                                UserProfil.select)
                                      }),
                              const SizedBox(height: 20),
                            ],
                          )))
                  : model.currentUserProfilScreen == UserProfil.select
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

abstract class UserProfilController extends StateNotifier<UserProfilModel> {
  UserProfilController(UserProfilModel state) : super(state);

  void switchCurrentUserProfilScreen(screen);
}
