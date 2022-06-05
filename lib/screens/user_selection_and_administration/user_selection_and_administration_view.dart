import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-editable-profile.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../assets/ui-components/buttons/perritos-button.dart';

class UserSelectionAndAdministrationView extends ConsumerWidget {
  final List<UserModel> _users;
  const UserSelectionAndAdministrationView(
      {Key? key, required List<UserModel> users})
      : _users = users,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserSelectionAndAdministrationController controller = ref.read(
        providers
            .userSelectionAndAdministrationControllerProvider(_users)
            .notifier);
    final UserSelectionAndAdministrationModel model = ref.watch(
        providers.userSelectionAndAdministrationControllerProvider(_users));

    TextEditingController textEditingController = TextEditingController();
    var buildWidget = Scaffold(
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
                                                  controller.changeSelectedUser(
                                                      UserModel(
                                                          user.emailID,
                                                          user.name,
                                                          !user.selected)),
                                                  model.editable == false
                                                      ? controller
                                                          .switchCurrentUserSelectionAndAdministrationScreen(
                                                              UserSelectionAndAdministration
                                                                  .select)
                                                      : controller
                                                          .switchCurrentUserSelectionAndAdministrationScreen(
                                                              UserSelectionAndAdministration
                                                                  .edit)
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
                                    child: FloatingActionButton(
                                        backgroundColor: PerritosColor
                                            .perritosCharcoal.color,
                                        child: const Icon(
                                          PerritosIcons.Icon_Add,
                                          size: 42,
                                        ),
                                        onPressed: () => {
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .add)
                                            }),
                                  ))
                                : const SizedBox(height: 42),
                            const SizedBox(height: 20),
                          ])))
              : model.currentUserSelectionAndAdministrationScreen ==
                      UserSelectionAndAdministration.add
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
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                        icon: const Icon(
                                            PerritosIcons.Icon_Arrow_Left),
                                        tooltip: 'Return',
                                        iconSize: 26,
                                        onPressed: () => {
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .kickoff)
                                            })),
                                const SizedBox(height: 60),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(children: [
                                      Column(
                                        children: [
                                          PerritosEditableProfile(
                                            icon: PerritosIcons.Icon_User,
                                            placeholder: "Name",
                                            label: "",
                                            onPressed: () => {
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .select)
                                            },
                                            textEditingController:
                                                textEditingController,
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                                (Align(
                                  alignment: Alignment.bottomCenter,
                                  child: PerritosButton(
                                    onPressed: () => {
                                      if (textEditingController.text != "")
                                        {
                                          controller.addUser(
                                            UserModel(
                                                model.userList.first.emailID,
                                                textEditingController.text,
                                                false),
                                          ),
                                          textEditingController.text = "",
                                          controller
                                              .switchCurrentUserSelectionAndAdministrationScreen(
                                                  UserSelectionAndAdministration
                                                      .kickoff)
                                        }
                                    },
                                    label: 'erstellen',
                                  ),
                                )),
                                const SizedBox(height: 20),
                              ])))
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 20),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: IconButton(
                                            icon: const Icon(
                                                PerritosIcons.Icon_Arrow_Left),
                                            tooltip: 'Return',
                                            iconSize: 26,
                                            onPressed: () => {
                                                  controller
                                                      .switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .kickoff)
                                                })),
                                    const SizedBox(height: 60),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Column(
                                            children: [
                                              PerritosEditableProfile(
                                                icon: PerritosIcons.Icon_User,
                                                placeholder: "Name",
                                                label: "",
                                                onPressed: () => {
                                                  controller
                                                      .switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .select)
                                                },
                                                textEditingController:
                                                    textEditingController,
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          ),
                                        ]),
                                      ),
                                    ),
                                    (Align(
                                      alignment: Alignment.bottomCenter,
                                      child: PerritosButton(
                                        onPressed: () => {
                                          if (textEditingController.text != "")
                                            {
                                              controller.addUser(UserModel(
                                                  model.userList.first.emailID,
                                                  textEditingController.text,
                                                  false)),
                                              textEditingController.text = "",
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .kickoff)
                                            }
                                        },
                                        label: 'bearbeiten',
                                      ),
                                    )),
                                    const SizedBox(height: 20),
                                  ])))
                      : Column(children: [
                          Text(
                            'Welcome back!',
                            style: perritosDoubleParagon,
                          ),
                          const SizedBox(height: 20),
                        ])),
    );
    return buildWidget;
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

  void changeSelectedUser(UserModel userModel);

  void disabledSelectedUser();

  UserModel getSelectedUser();
}
