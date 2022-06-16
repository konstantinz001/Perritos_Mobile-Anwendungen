import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-button.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-icon-button.dart';
import 'package:flutter_application/assets/ui-components/date-picker/perritos-date-picker.dart';
import 'package:flutter_application/assets/ui-components/date-time-picker/perritos-date-time-picker.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-editable-profile.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_description_input.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_txt_input.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/common/models/dog_model.dart';
import 'package:flutter_application/screens/calendar/calendar_controller.dart';
import 'package:flutter_application/screens/dog_selection_and_administration/dog_selection_and_administration_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DogSelectionAndAdministrationView extends ConsumerWidget {
  final List<DogModel> _dogs;
  final String _emailID;
  final String _userName;
  const DogSelectionAndAdministrationView(
      {Key? key,
      required List<DogModel> dogs,
      required String emailID,
      required String userName})
      : _dogs = dogs,
        _emailID = emailID,
        _userName = userName,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DogSelectionAndAdministrationController controller = ref.read(
        providers
            .dogSelectionAndAdministrationControllerProvider(_dogs)
            .notifier);
    final DogSelectionAndAdministrationModel model = ref.watch(
        providers.dogSelectionAndAdministrationControllerProvider(_dogs));

    TextEditingController textEditingControllerName = TextEditingController();
    textEditingControllerName.text = model.dogName;
    TextEditingController textEditingControllerRasse = TextEditingController();
    textEditingControllerRasse.text = model.rasse;
    TextEditingController textEditingControllerInfo = TextEditingController();
    textEditingControllerInfo.text = model.info;
    TextEditingController textEditingControllerBirthday =
        TextEditingController();
    textEditingControllerBirthday.text =
        model.birthday.toDate().toString(); //TODO IST FALSCH

    var buildWidget = Scaffold(
      body: Center(
          child: model.currentDogSelectionAndAdministrationScreen ==
                  DogSelectionAndAdministration.kickoff
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
                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                      DogSelectionAndAdministration
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
                                                      .switchCurrentDogSelectionAndAdministrationScreen(
                                                          DogSelectionAndAdministration
                                                              .kickoff)
                                                })
                                      ],
                                    )),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  const SizedBox(height: 60),
                                  if (!model.editable)
                                    Column(
                                      children: [
                                        PerritosProfile(
                                            icon: PerritosIcons.Icon_Perritos,
                                            perritosColor:
                                                PerritosColor.perritosCharcoal,
                                            label: 'Perritos',
                                            edit: false,
                                            onPressed: () => {
                                                  Navigator.pushNamed(
                                                      context, "/Home",
                                                      arguments: {
                                                        'emailID': _emailID,
                                                        'userName': _userName,
                                                        'dogName': model.dogList
                                                            .map((dog) =>
                                                                dog.name)
                                                            .toList(),
                                                        'perritos': true
                                                      }),
                                                }),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  for (var dog in model.dogList)
                                    Column(
                                      children: [
                                        PerritosProfile(
                                            icon: dog.iconName ==
                                                    'Icon_Smiley_Happy'
                                                ? PerritosIcons
                                                    .Icon_Smiley_Happy
                                                : dog.iconName ==
                                                        'Icon_Smiley_Sad'
                                                    ? PerritosIcons
                                                        .Icon_Smiley_Sad
                                                    : PerritosIcons.Icon_Dog,
                                            perritosColor: dog.iconColor ==
                                                    'perritosGoldFusion'
                                                ? PerritosColor
                                                    .perritosGoldFusion
                                                : dog.iconColor ==
                                                        'perritosMaizeCrayola'
                                                    ? PerritosColor
                                                        .perritosMaizeCrayola
                                                    : dog.iconColor ==
                                                            'perritosSandyBrown'
                                                        ? PerritosColor
                                                            .perritosSandyBrown
                                                        : dog.iconColor ==
                                                                'perritosBurntSienna'
                                                            ? PerritosColor
                                                                .perritosBurntSienna
                                                            : PerritosColor
                                                                .perritosCharcoal,
                                            label: dog.name,
                                            edit: model.editable,
                                            onPressed: () => {
                                                  model.editable == false
                                                      ? Navigator.pushNamed(
                                                          context, "/Home",
                                                          arguments: {
                                                              'emailID':
                                                                  _emailID,
                                                              'userName':
                                                                  _userName,
                                                              'dogName': [
                                                                dog.name
                                                              ]
                                                            })
                                                      : {
                                                          controller
                                                              .changeSelectedDog(
                                                                  dog),
                                                          controller.setEditingIconColor(
                                                              controller
                                                                  .getSelectedDog()!
                                                                  .iconColor),
                                                          controller
                                                              .setEditingIconName(
                                                                  controller
                                                                      .getSelectedDog()!
                                                                      .iconName),
                                                          controller.setEditingName(
                                                              controller
                                                                  .getSelectedDog()!
                                                                  .name),
                                                          controller
                                                              .setEditingRasse(
                                                                  controller
                                                                      .getSelectedDog()!
                                                                      .rasse),
                                                          controller.setEditingInfo(
                                                              controller
                                                                  .getSelectedDog()!
                                                                  .info),
                                                          controller
                                                              .setEditingBirthbday(
                                                                  controller
                                                                      .getSelectedDog()!
                                                                      .birthday),
                                                          controller
                                                              .switchCurrentDogSelectionAndAdministrationScreen(
                                                                  DogSelectionAndAdministration
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
                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                      DogSelectionAndAdministration
                                                          .add)
                                            }),
                                  ))
                                : const SizedBox(height: 42),
                            const SizedBox(height: 20),
                          ])))
              : model.currentDogSelectionAndAdministrationScreen ==
                      DogSelectionAndAdministration.add
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
                                                  .loadDogs(_emailID)
                                                  .then((doglist) => {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/DogSelectionAndAdministration',
                                                            arguments: {
                                                              'emailID':
                                                                  _emailID,
                                                              'userName':
                                                                  _userName,
                                                              'dogList': doglist
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
                                                    : PerritosIcons.Icon_Dog,
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
                                            label:
                                                textEditingControllerName.text,
                                            onPressed: () => {
                                              controller.setEditingName(
                                                  textEditingControllerName
                                                      .text),
                                              controller
                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                      DogSelectionAndAdministration
                                                          .changeIconName)
                                            },
                                            textEditingController:
                                                textEditingControllerName,
                                          ),
                                          /*PerritosDatePicker(
                                            initDate: DateTime.now(),
                                            onSubmitDate: (date) => {
                                              textEditingControllerBirthday
                                                      .text =
                                                  DateFormat.yMd('de')
                                                      .format(date),
                                              print(
                                                  textEditingControllerBirthday
                                                      .text),
                                            },
                                          ),*/
                                          PerritosTxtInput(
                                            onSubmit: (value) => {
                                              controller.setEditingRasse(value)
                                            },
                                            initialValue: model.rasse,
                                            label: "Rasse",
                                          ),
                                          const SizedBox(height: 10),
                                          PerritosTxtInput(
                                            onSubmit: (value) => {
                                              controller.setEditingBirthbday(
                                                  Timestamp.fromDate(
                                                      DateFormat("dd.MM.yyyy")
                                                          .parse(value)))
                                            },
                                            label: "Geburtstag:",
                                            initialValue:
                                                DateFormat("dd.MM.yyyy").format(
                                                    model.birthday.toDate()),
                                            //ALS DatePicker
                                          ),
                                          const SizedBox(height: 10),
                                          PerritosDescriptionInput(
                                            onSubmit: (value) => {
                                              controller.setEditingInfo(value)
                                            },
                                            label: "Info:",
                                            initialValue: model.info,
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
                                      if (textEditingControllerName.text != "")
                                        {
                                          controller
                                              .addDog(DogModel(
                                                  _emailID,
                                                  textEditingControllerName
                                                      .text,
                                                  false,
                                                  model.iconName,
                                                  model.iconColor,
                                                  model.rasse,
                                                  model.birthday,
                                                  model.info))
                                              .then((value) => controller
                                                  .loadDogs(_emailID)
                                                  .then((doglist) => {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/DogSelectionAndAdministration',
                                                            arguments: {
                                                              'emailID':
                                                                  _emailID,
                                                              'userName':
                                                                  _userName,
                                                              'dogList': doglist
                                                            })
                                                      }))
                                        },
                                    },
                                    label: 'erstellen',
                                  ),
                                )),
                                const SizedBox(height: 60),
                              ])))
                  : model.currentDogSelectionAndAdministrationScreen ==
                          DogSelectionAndAdministration.edit
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
                                                      .loadDogs(_emailID)
                                                      .then((doglist) => {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/DogSelectionAndAdministration',
                                                                arguments: {
                                                                  'emailID':
                                                                      _emailID,
                                                                  'userName':
                                                                      _userName,
                                                                  'dogList':
                                                                      doglist
                                                                })
                                                          }),
                                                })),
                                    const SizedBox(height: 60),
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
                                                    : controller
                                                                .getSelectedDog()!
                                                                .iconName ==
                                                            'Icon_Smiley_Sad'
                                                        ? PerritosIcons
                                                            .Icon_Smiley_Sad
                                                        : PerritosIcons
                                                            .Icon_Dog,
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
                                                placeholder: model.dogName,
                                                label: textEditingControllerName
                                                    .text,
                                                onPressed: () => {
                                                  controller.setEditingName(
                                                      textEditingControllerName
                                                          .text),
                                                  controller
                                                      .switchCurrentDogSelectionAndAdministrationScreen(
                                                          DogSelectionAndAdministration
                                                              .changeIconName)
                                                },
                                                textEditingController:
                                                    textEditingControllerName,
                                              ),
                                              PerritosTxtInput(
                                                onSubmit: (value) => {
                                                  controller
                                                      .setEditingRasse(value)
                                                },
                                                initialValue: model.rasse,
                                                label: "Rasse",
                                              ),
                                              const SizedBox(height: 10),
                                              PerritosTxtInput(
                                                onSubmit: (value) => {
                                                  controller.setEditingBirthbday(
                                                      Timestamp.fromDate(
                                                          DateFormat(
                                                                  "dd.MM.yyyy")
                                                              .parse(value)))
                                                },
                                                label: "Geburtstag:",
                                                initialValue:
                                                    DateFormat("dd.MM.yyyy")
                                                        .format(model.birthday
                                                            .toDate()),
                                                //ALS DatePicker
                                              ),
                                              const SizedBox(height: 10),
                                              PerritosDescriptionInput(
                                                onSubmit: (value) => {
                                                  controller
                                                      .setEditingInfo(value)
                                                },
                                                label: "Info:",
                                                initialValue: model.info,
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
                                          if (textEditingControllerName.text !=
                                              "")
                                            {
                                              controller
                                                  .updateDog(DogModel(
                                                      _emailID,
                                                      textEditingControllerName
                                                          .text,
                                                      false,
                                                      model.iconName,
                                                      model.iconColor,
                                                      model.rasse,
                                                      model.birthday,
                                                      model.info))
                                                  .then((value) => controller
                                                      .loadDogs(_emailID)
                                                      .then((doglist) => {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/DogSelectionAndAdministration',
                                                                arguments: {
                                                                  'emailID':
                                                                      _emailID,
                                                                  'userName':
                                                                      _userName,
                                                                  'dogList':
                                                                      doglist
                                                                })
                                                          }))
                                            },
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
                                                      .deleteDog(DogModel(
                                                          _emailID,
                                                          model.dogName,
                                                          false,
                                                          model.iconName,
                                                          model.iconColor,
                                                          model.rasse,
                                                          model.birthday,
                                                          model.info))
                                                      .then((value) =>
                                                          controller
                                                              .loadDogs(
                                                                  _emailID)
                                                              .then(
                                                                  (doglist) => {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            '/DogSelectionAndAdministration',
                                                                            arguments: {
                                                                              'emailID': _emailID,
                                                                              'userName': _userName,
                                                                              'dogList': doglist
                                                                            })
                                                                      }))
                                                },
                                            icon: PerritosIcons.Icon_Remove),
                                        const Spacer()
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ])))
                      : model.currentDogSelectionAndAdministrationScreen ==
                              DogSelectionAndAdministration.changeIconName
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
                                                                        .getSelectedDog() ==
                                                                    null)
                                                                  {
                                                                    textEditingControllerName
                                                                            .text =
                                                                        model
                                                                            .dogName,
                                                                    controller.switchCurrentDogSelectionAndAdministrationScreen(
                                                                        DogSelectionAndAdministration
                                                                            .add)
                                                                  }
                                                                else
                                                                  {
                                                                    textEditingControllerName
                                                                            .text =
                                                                        controller
                                                                            .getSelectedDog()!
                                                                            .name,
                                                                    controller.switchCurrentDogSelectionAndAdministrationScreen(
                                                                        DogSelectionAndAdministration
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
                                                icon: PerritosIcons.Icon_Dog,
                                                label: "Der Dog",
                                                onPressed: () => {
                                                      controller
                                                          .setEditingIconName(
                                                              'Icon_Dog'),
                                                      controller.switchCurrentDogSelectionAndAdministrationScreen(
                                                          DogSelectionAndAdministration
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
                                                      controller.switchCurrentDogSelectionAndAdministrationScreen(
                                                          DogSelectionAndAdministration
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
                                                      controller.switchCurrentDogSelectionAndAdministrationScreen(
                                                          DogSelectionAndAdministration
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
                                                                            controller.switchCurrentDogSelectionAndAdministrationScreen(DogSelectionAndAdministration.changeIconName)
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
                                                                .Icon_Dog,
                                                    perritosColor: PerritosColor
                                                        .perritosCharcoal,
                                                    label: "charcoal",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosCharcoal'),
                                                          textEditingControllerName
                                                                  .text =
                                                              model.dogName,
                                                          if (controller
                                                                  .getSelectedDog() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
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
                                                                .Icon_Dog,
                                                    perritosColor: PerritosColor
                                                        .perritosGoldFusion,
                                                    label: "gold-fusion",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosGoldFusion'),
                                                          if (controller
                                                                  .getSelectedDog() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
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
                                                                .Icon_Dog,
                                                    perritosColor: PerritosColor
                                                        .perritosMaizeCrayola,
                                                    label: "maize-crayola",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosMaizeCrayola'),
                                                          textEditingControllerName
                                                                  .text =
                                                              model.dogName,
                                                          if (controller
                                                                  .getSelectedDog() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
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
                                                                .Icon_Dog,
                                                    perritosColor: PerritosColor
                                                        .perritosSandyBrown,
                                                    label: "sandy-brown",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosSandyBrown'),
                                                          textEditingControllerName
                                                                  .text =
                                                              model.dogName,
                                                          if (controller
                                                                  .getSelectedDog() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
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
                                                                .Icon_Dog,
                                                    perritosColor: PerritosColor
                                                        .perritosBurntSienna,
                                                    label: "burnt-sienna",
                                                    onPressed: () => {
                                                          controller
                                                              .setEditingIconColor(
                                                                  'perritosBurntSienna'),
                                                          textEditingControllerName
                                                                  .text =
                                                              model.dogName,
                                                          if (controller
                                                                  .getSelectedDog() ==
                                                              null)
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
                                                                          .add)
                                                            }
                                                          else
                                                            {
                                                              controller
                                                                  .switchCurrentDogSelectionAndAdministrationScreen(
                                                                      DogSelectionAndAdministration
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

abstract class DogSelectionAndAdministrationController
    extends StateNotifier<DogSelectionAndAdministrationModel> {
  DogSelectionAndAdministrationController(
      DogSelectionAndAdministrationModel state)
      : super(state);

  void switchCurrentDogSelectionAndAdministrationScreen(screen);

  Future<void> addDog(DogModel dogModel);
  Future<void> updateDog(DogModel dogModel);
  Future<void> deleteDog(DogModel dogModel);

  void changeEditability();

  void changeSelectedDog(DogModel dogModel);

  void disabledSelectedDog();

  DogModel? getSelectedDog();
  Future<List<DogModel>> loadDogs(String email);
  void setEditingName(String name);
  void setEditingIconColor(String iconColor);
  void setEditingIconName(String iconName);
  void setEditingRasse(String rasse);
  void setEditingBirthbday(Timestamp birthbday);
  void setEditingInfo(String info);
  void setEditingDefault();
}
