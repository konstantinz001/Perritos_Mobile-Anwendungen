import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-button.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-icon-button.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-editable-profile.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-editable-profileReadOnly.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/common/models/users/dog_model.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/common/models/users/user_model.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSelectionAndAdministrationView extends ConsumerWidget {
  final List<UserModel> _users;
  final String _emailID;
  const UserSelectionAndAdministrationView(
      {Key? key, required List<UserModel> users, required String emailID})
      : _users = users,
        _emailID = emailID,
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
    textEditingController.text = model.userName;
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
                                        color: perritosCharcoal,
                                        icon:
                                            const Icon(PerritosIcons.Icon_Edit),
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
                                    child: Column(
                                      children: [
                                        IconButton(
                                            color: perritosCharcoal,
                                            icon: const Icon(
                                                PerritosIcons.Icon_Arrow_Left),
                                            iconSize: 40,
                                            onPressed: () => {
                                                  controller
                                                      .changeEditability(),
                                                  controller
                                                      .switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .kickoff)
                                                })
                                      ],
                                    )),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  const SizedBox(height: 60),
                                  for (var user in model.userList)
                                    Column(
                                      children: [
                                        PerritosProfile(
                                            icon: user.iconName ==
                                                    'Icon_Smiley_Happy'
                                                ? PerritosIcons
                                                    .Icon_Smiley_Happy
                                                : user.iconName ==
                                                        'Icon_Smiley_Sad'
                                                    ? PerritosIcons
                                                        .Icon_Smiley_Sad
                                                    : PerritosIcons.Icon_User,
                                            perritosColor: user.iconColor ==
                                                    'perritosGoldFusion'
                                                ? PerritosColor
                                                    .perritosGoldFusion
                                                : user.iconColor ==
                                                        'perritosMaizeCrayola'
                                                    ? PerritosColor
                                                        .perritosMaizeCrayola
                                                    : user.iconColor ==
                                                            'perritosSandyBrown'
                                                        ? PerritosColor
                                                            .perritosSandyBrown
                                                        : user.iconColor ==
                                                                'perritosBurntSienna'
                                                            ? PerritosColor
                                                                .perritosBurntSienna
                                                            : PerritosColor
                                                                .perritosCharcoal,
                                            label: user.name,
                                            edit: model.editable,
                                            onPressed: () async => {
                                                  /*controller
                                                      .disabledSelectedUser(),*/
                                                  model.editable == false
                                                      ? {
                                                          await controller
                                                              .loadDogs(
                                                                  _emailID)
                                                              .then(
                                                                  (dogList) => {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            "/DogSelectionAndAdministration",
                                                                            arguments: {
                                                                              'emailID': _emailID,
                                                                              'userName': user.name,
                                                                              'dogList': dogList,
                                                                              'selectedUser': user
                                                                            })
                                                                      })
                                                        }
                                                      : {
                                                          controller
                                                              .changeSelectedUser(
                                                                  user),
                                                          controller.setEditingIconColor(
                                                              controller
                                                                  .getSelectedUser()!
                                                                  .iconColor),
                                                          controller
                                                              .setEditingIconName(
                                                                  controller
                                                                      .getSelectedUser()!
                                                                      .iconName),
                                                          controller.setEditingName(
                                                              controller
                                                                  .getSelectedUser()!
                                                                  .name),
                                                          textEditingController
                                                                  .text =
                                                              model.userName,
                                                          controller
                                                              .switchCurrentUserSelectionAndAdministrationScreen(
                                                                  UserSelectionAndAdministration
                                                                      .edit)
                                                        }
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
                                              controller.setEditingDefault(),
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
                                        color: perritosCharcoal,
                                        icon: const Icon(
                                            PerritosIcons.Icon_Arrow_Left),
                                        iconSize: 40,
                                        onPressed: () async => {
                                              controller
                                                  .loadUsers(_emailID)
                                                  .then((userlist) => {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/UserSelectionAndAdministration',
                                                            arguments: {
                                                              'emailID':
                                                                  _emailID,
                                                              'userList':
                                                                  userlist
                                                            })
                                                      }),
                                            })),
                                const SizedBox(height: 30),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(children: [
                                      Column(
                                        children: [
                                          PerritosEditableProfile(
                                            icon: model.iconName ==
                                                    'Icon_Smiley_Happy'
                                                ? PerritosIcons
                                                    .Icon_Smiley_Happy
                                                : model.iconName ==
                                                        'Icon_Smiley_Sad'
                                                    ? PerritosIcons
                                                        .Icon_Smiley_Sad
                                                    : PerritosIcons.Icon_User,
                                            perritosColor: model.iconColor ==
                                                    'perritosGoldFusion'
                                                ? PerritosColor
                                                    .perritosGoldFusion
                                                : model.iconColor ==
                                                        'perritosMaizeCrayola'
                                                    ? PerritosColor
                                                        .perritosMaizeCrayola
                                                    : model.iconColor ==
                                                            'perritosSandyBrown'
                                                        ? PerritosColor
                                                            .perritosSandyBrown
                                                        : model.iconColor ==
                                                                'perritosBurntSienna'
                                                            ? PerritosColor
                                                                .perritosBurntSienna
                                                            : PerritosColor
                                                                .perritosCharcoal,
                                            placeholder: "Name",
                                            label: textEditingController.text,
                                            onPressed: () => {
                                              controller.setEditingName(
                                                  textEditingController.text),
                                              controller
                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                      UserSelectionAndAdministration
                                                          .changeIconName)
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
                                    onPressed: () async => {
                                      if (textEditingController.text != "")
                                        {
                                          controller
                                              .addUser(UserModel(
                                                  _emailID,
                                                  textEditingController.text,
                                                  false,
                                                  model.iconName,
                                                  model.iconColor))
                                              .then((value) => controller
                                                  .loadUsers(_emailID)
                                                  .then((userlist) => {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/UserSelectionAndAdministration',
                                                            arguments: {
                                                              'emailID':
                                                                  _emailID,
                                                              'userList':
                                                                  userlist
                                                            })
                                                      }))
                                        },
                                    },
                                    label: 'erstellen',
                                  ),
                                )),
                                const SizedBox(height: 60),
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
                                            color: perritosCharcoal,
                                            icon: const Icon(
                                                PerritosIcons.Icon_Arrow_Left),
                                            iconSize: 40,
                                            onPressed: () async => {
                                                  controller
                                                      .loadUsers(_emailID)
                                                      .then((userlist) => {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/UserSelectionAndAdministration',
                                                                arguments: {
                                                                  'emailID':
                                                                      _emailID,
                                                                  'userList':
                                                                      userlist
                                                                })
                                                          }),
                                                })),
                                    const SizedBox(height: 30),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Column(
                                            children: [
                                              PerritosEditableProfileReadOnly(
                                                icon: model.iconName ==
                                                        'Icon_Smiley_Happy'
                                                    ? PerritosIcons
                                                        .Icon_Smiley_Happy
                                                    : controller
                                                                .getSelectedUser()!
                                                                .iconName ==
                                                            'Icon_Smiley_Sad'
                                                        ? PerritosIcons
                                                            .Icon_Smiley_Sad
                                                        : PerritosIcons
                                                            .Icon_User,
                                                perritosColor: model
                                                            .iconColor ==
                                                        'perritosGoldFusion'
                                                    ? PerritosColor
                                                        .perritosGoldFusion
                                                    : model.iconColor ==
                                                            'perritosMaizeCrayola'
                                                        ? PerritosColor
                                                            .perritosMaizeCrayola
                                                        : model.iconColor ==
                                                                'perritosSandyBrown'
                                                            ? PerritosColor
                                                                .perritosSandyBrown
                                                            : model.iconColor ==
                                                                    'perritosBurntSienna'
                                                                ? PerritosColor
                                                                    .perritosBurntSienna
                                                                : PerritosColor
                                                                    .perritosCharcoal,
                                                label:
                                                    textEditingController.text,
                                                onPressed: () => {
                                                  controller.setEditingName(
                                                      textEditingController
                                                          .text),
                                                  controller
                                                      .switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .changeIconName)
                                                },
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
                                        onPressed: () async => {
                                          controller
                                              .updateUser(UserModel(
                                                  _emailID,
                                                  textEditingController.text,
                                                  false,
                                                  model.iconName,
                                                  model.iconColor))
                                              .then((value) => controller
                                                  .loadUsers(_emailID)
                                                  .then((userlist) => {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/UserSelectionAndAdministration',
                                                            arguments: {
                                                              'emailID':
                                                                  _emailID,
                                                              'userList':
                                                                  userlist
                                                            })
                                                      }))
                                        },
                                        label: 'bearbeiten',
                                      ),
                                    )),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        PerritosIconButton(
                                            label: "Profil löschen",
                                            onPressed: () async => {
                                                  //NOCH EINFÜGE
                                                  controller
                                                      .deleteUser(UserModel(
                                                          _emailID,
                                                          model.userName,
                                                          false,
                                                          model.iconName,
                                                          model.iconColor))
                                                      .then((value) =>
                                                          controller
                                                              .loadUsers(
                                                                  _emailID)
                                                              .then(
                                                                  (userlist) =>
                                                                      {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            '/UserSelectionAndAdministration',
                                                                            arguments: {
                                                                              'emailID': _emailID,
                                                                              'userList': userlist
                                                                            })
                                                                      }))
                                                },
                                            icon: PerritosIcons.Icon_Remove),
                                        const Spacer()
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ])))
                      : model.currentUserSelectionAndAdministrationScreen ==
                              UserSelectionAndAdministration.changeIconName
                          ? Container(
                              color: PerritosColor.perritosSnow.color,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 60,
                                    right: 10,
                                    bottom: 0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          child: SingleChildScrollView(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                      child: PerritosIconButton(
                                                          //PROBLEM: Was wenn wir davor in edit waren???
                                                          onPressed: () => {
                                                                //DAS DA MUSS REIN BEVOR WIR IN EDIT VIEW GEHEN!!!
                                                                if (controller
                                                                        .getSelectedUser() ==
                                                                    null)
                                                                  {
                                                                    textEditingController
                                                                            .text =
                                                                        model
                                                                            .userName,
                                                                    controller.switchCurrentUserSelectionAndAdministrationScreen(
                                                                        UserSelectionAndAdministration
                                                                            .add)
                                                                  }
                                                                else
                                                                  {
                                                                    textEditingController
                                                                            .text =
                                                                        controller
                                                                            .getSelectedUser()!
                                                                            .name,
                                                                    controller.switchCurrentUserSelectionAndAdministrationScreen(
                                                                        UserSelectionAndAdministration
                                                                            .edit)
                                                                  }
                                                              },
                                                          iconSize: 40,
                                                          icon: PerritosIcons
                                                              .Icon_Arrow_Left)),
                                                  Text(
                                                    'Profilbild',
                                                    style:
                                                        perritosDoubleParagon,
                                                  ),
                                                  const Spacer()
                                                ]),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            PerritosProfile(
                                                icon: PerritosIcons.Icon_User,
                                                label: "Der User",
                                                onPressed: () => {
                                                      controller
                                                          .setEditingIconName(
                                                              'Icon_User'),
                                                      controller.switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .changeIconColor)
                                                    }),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            PerritosProfile(
                                                icon: PerritosIcons
                                                    .Icon_Smiley_Happy,
                                                label: "Der Glückliche",
                                                onPressed: () => {
                                                      controller
                                                          .setEditingIconName(
                                                              'Icon_Smiley_Happy'),
                                                      controller.switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .changeIconColor)
                                                    }),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            PerritosProfile(
                                                icon: PerritosIcons
                                                    .Icon_Smiley_Sad,
                                                label: "Der Traurige",
                                                onPressed: () => {
                                                      controller
                                                          .setEditingIconName(
                                                              'Icon_Smiley_Sad'),
                                                      controller.switchCurrentUserSelectionAndAdministrationScreen(
                                                          UserSelectionAndAdministration
                                                              .changeIconColor)
                                                    }),
                                          ])))
                                    ],
                                  )))
                          : Container(
                              color: PerritosColor.perritosSnow.color,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 60,
                                    right: 10,
                                    bottom: 0,
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                            child: SingleChildScrollView(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(width: 10),
                                                      Expanded(
                                                          child:
                                                              PerritosIconButton(
                                                                  onPressed:
                                                                      () => {
                                                                            controller.switchCurrentUserSelectionAndAdministrationScreen(UserSelectionAndAdministration.changeIconName)
                                                                          },
                                                                  iconSize: 40,
                                                                  icon: PerritosIcons
                                                                      .Icon_Arrow_Left)),
                                                      Text(
                                                        'Profilbild Farbe',
                                                        style:
                                                            perritosDoubleParagon,
                                                      ),
                                                      const Spacer()
                                                    ]),
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                PerritosProfile(
                                                    icon: model.iconName ==
                                                            'Icon_Smiley_Happy'
                                                        ? PerritosIcons
                                                            .Icon_Smiley_Happy
                                                        : model.iconName ==
                                                                'Icon_Smiley_Sad'
                                                            ? PerritosIcons
                                                                .Icon_Smiley_Sad
                                                            : PerritosIcons
                                                                .Icon_User,
                                                    perritosColor: PerritosColor
                                                        .perritosCharcoal,
                                                    label: "charcoal",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosCharcoal'),
                                                          textEditingController
                                                                  .text =
                                                              model.userName,
                                                          if (controller
                                                                  .getSelectedUser() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .edit)
                                                            }
                                                        }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                PerritosProfile(
                                                    icon: model.iconName ==
                                                            'Icon_Smiley_Happy'
                                                        ? PerritosIcons
                                                            .Icon_Smiley_Happy
                                                        : model.iconName ==
                                                                'Icon_Smiley_Sad'
                                                            ? PerritosIcons
                                                                .Icon_Smiley_Sad
                                                            : PerritosIcons
                                                                .Icon_User,
                                                    perritosColor: PerritosColor
                                                        .perritosGoldFusion,
                                                    label: "gold-fusion",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosGoldFusion'),
                                                          if (controller
                                                                  .getSelectedUser() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .edit)
                                                            }
                                                        }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                PerritosProfile(
                                                    icon: model.iconName ==
                                                            'Icon_Smiley_Happy'
                                                        ? PerritosIcons
                                                            .Icon_Smiley_Happy
                                                        : model.iconName ==
                                                                'Icon_Smiley_Sad'
                                                            ? PerritosIcons
                                                                .Icon_Smiley_Sad
                                                            : PerritosIcons
                                                                .Icon_User,
                                                    perritosColor: PerritosColor
                                                        .perritosMaizeCrayola,
                                                    label: "maize-crayola",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosMaizeCrayola'),
                                                          textEditingController
                                                                  .text =
                                                              model.userName,
                                                          if (controller
                                                                  .getSelectedUser() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .edit)
                                                            }
                                                        }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                PerritosProfile(
                                                    icon: model.iconName ==
                                                            'Icon_Smiley_Happy'
                                                        ? PerritosIcons
                                                            .Icon_Smiley_Happy
                                                        : model.iconName ==
                                                                'Icon_Smiley_Sad'
                                                            ? PerritosIcons
                                                                .Icon_Smiley_Sad
                                                            : PerritosIcons
                                                                .Icon_User,
                                                    perritosColor: PerritosColor
                                                        .perritosSandyBrown,
                                                    label: "sandy-brown",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosSandyBrown'),
                                                          textEditingController
                                                                  .text =
                                                              model.userName,
                                                          if (controller
                                                                  .getSelectedUser() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .edit)
                                                            }
                                                        }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                PerritosProfile(
                                                    icon: model.iconName ==
                                                            'Icon_Smiley_Happy'
                                                        ? PerritosIcons
                                                            .Icon_Smiley_Happy
                                                        : model.iconName ==
                                                                'Icon_Smiley_Sad'
                                                            ? PerritosIcons
                                                                .Icon_Smiley_Sad
                                                            : PerritosIcons
                                                                .Icon_User,
                                                    perritosColor: PerritosColor
                                                        .perritosBurntSienna,
                                                    label: "burnt-sienna",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosBurntSienna'),
                                                          textEditingController
                                                                  .text =
                                                              model.userName,
                                                          if (controller
                                                                  .getSelectedUser() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentUserSelectionAndAdministrationScreen(
                                                                      UserSelectionAndAdministration
                                                                          .edit)
                                                            }
                                                        }),
                                              ]),
                                        ))
                                      ])))),
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

  Future<void> addUser(UserModel userModel);
  Future<void> updateUser(UserModel userModel);
  Future<void> deleteUser(UserModel userModel);

  void changeEditability();

  void changeSelectedUser(UserModel userModel);

  void disabledSelectedUser();

  UserModel? getSelectedUser();
  Future<List<UserModel>> loadUsers(String email);
  Future<List<DogModel>> loadDogs(String email);
  void setEditingName(String name);
  void setEditingIconColor(String iconColor);
  void setEditingIconName(String iconName);
  void setEditingDefault();
}
