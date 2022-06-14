import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/action/perritos-action.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-button.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-icon-button.dart';
import 'package:flutter_application/assets/ui-components/chips/perritos-chip.dart';
import 'package:flutter_application/assets/ui-components/date-time-picker/perritos-date-time-picker.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/assets/ui-components/slider/perritos-slider.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_description_input.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_search_input.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_txt_input.dart';
import 'package:flutter_application/common/models/action_abnormality_model.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'package:flutter_application/common/models/action_task_model.dart';
import 'package:flutter_application/common/models/user_model.dart';
import 'package:flutter_application/common/models/dog_model.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/calendar/calendar_model.dart';
import 'package:flutter_application/screens/calendar/calendar_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

import 'home_model.dart';

class HomeView extends ConsumerWidget {
  final List<String> _dogName;
  final String _emailID;
  final String _userName;
  final ActionDateModel? _dateModel;
  const HomeView(
      {Key? key,
      required List<String> dogName,
      required String emailID,
      required String userName,
      required ActionDateModel? dateModel})
      : _dogName = dogName,
        _emailID = emailID,
        _userName = userName,
        _dateModel = dateModel,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller = ref.read(providers
        .homeControllerProvider(Tuple3(_userName, _dogName, _dateModel))
        .notifier);
    final HomeModel model = ref.watch(providers
        .homeControllerProvider(Tuple3(_userName, _dogName, _dateModel)));

    var overviewScreen = Scaffold(
        backgroundColor: PerritosColor.perritosSnow.color,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
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
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              PerritosIcons.Icon_Dog,
                              size: 26,
                              color: PerritosColor.perritosGoldFusion.color,
                            ),
                            onPressed: () async => {
                                  await controller
                                      .loadDogsFromDB(_emailID)
                                      .then((dogList) => {
                                            Navigator.pushNamed(context,
                                                "/DogSelectionAndAdministration",
                                                arguments: {
                                                  'emailID': _emailID,
                                                  'userName': _userName,
                                                  'dogList': dogList
                                                })
                                          })
                                }),
                        const Spacer(),
                        IconButton(
                            icon: Icon(
                              PerritosIcons.Icon_User,
                              size: 26,
                              color: PerritosColor.perritosBurntSienna.color,
                            ),
                            onPressed: () async => {
                                  await controller
                                      .loadUsersFromDB(_emailID)
                                      .then((userList) => {
                                            Navigator.pushNamed(context,
                                                '/UserSelectionAndAdministration',
                                                arguments: {
                                                  'emailID': _emailID,
                                                  'userList': userList
                                                })
                                          })
                                }),
                      ],
                    ))
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                        child: PerritosSearchInput(
                            onSubmit: (searchString) async => {
                                  controller.changeSearchString(searchString),
                                }))
                  ],
                ),
                SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Aufgaben',
                      style: perritosDoubleParagon,
                    ),
                    FutureBuilder(
                        future: controller.loadActionTasksFromDB(
                            _emailID, _userName, _dogName),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ActionTaskModel>> snapshot) {
                          return Column(children: [
                            for (var action in snapshot.data ?? [])
                              PerritosAction(
                                icon: PerritosIcons.Icon_Task,
                                value: "",
                                label: action.title,
                                onPressed: () {
                                  controller.selectActionType(ActionType.task);
                                  controller
                                      .changeCurrentActionId(action.actionID)
                                      .then((value) => {
                                            controller.switchHomeScreen(
                                                HomeScreen.editAction)
                                          });
                                },
                              )
                          ]);
                        }),
                    const SizedBox(height: 20),
                    Text(
                      'Termine',
                      style: perritosDoubleParagon,
                    ),
                    FutureBuilder(
                        future: controller.loadActionDatesFromDB(
                            _emailID, _userName, _dogName),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ActionDateModel>> snapshot) {
                          return Column(children: [
                            for (var action in snapshot.data ?? [])
                              PerritosAction(
                                icon: PerritosIcons.Icon_Date,
                                value:
                                    '${DateFormat("dd.mm.yyyy hh:mm").format(action.begin.toDate())} bis ${DateFormat("dd.mm.yyyy hh:mm").format(action.end.toDate())}',
                                label: action.title,
                                onPressed: () {
                                  controller.selectActionType(ActionType.date);
                                  controller
                                      .changeCurrentActionId(action.actionID)
                                      .then((value) => {
                                            controller.switchHomeScreen(
                                                HomeScreen.editAction)
                                          });
                                },
                              )
                          ]);
                        }),
                    const SizedBox(height: 20),
                    Text(
                      'Auffälligkeiten',
                      style: perritosDoubleParagon,
                    ),
                    FutureBuilder(
                        future: controller.loadActionAbnormalitiesFromDB(
                            _emailID, _userName, _dogName),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ActionAbnormalityModel>>
                                snapshot) {
                          return Column(children: [
                            for (var action in snapshot.data ?? [])
                              PerritosAction(
                                icon: action.emotionalState < 5
                                    ? PerritosIcons.Icon_Smiley_Happy
                                    : PerritosIcons.Icon_Smiley_Sad,
                                value: '',
                                label: action.title,
                                onPressed: () {
                                  controller
                                      .selectActionType(ActionType.abnormality);
                                  controller
                                      .changeCurrentActionId(action.actionID)
                                      .then((value) => {
                                            controller.switchHomeScreen(
                                                HomeScreen.editAction)
                                          });
                                },
                              )
                          ]);
                        }),
                  ],
                )),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                      backgroundColor: PerritosColor.perritosCharcoal.color,
                      child: const Icon(
                        PerritosIcons.Icon_Add,
                        size: 42,
                      ),
                      onPressed: () => {
                            controller
                                .switchHomeScreen(HomeScreen.selectActionType)
                          }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: PerritosColor.perritosSnow.color,
          child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 0,
                right: 10,
                bottom: 10,
              ),
              child: PerritosNavigationBar(
                activeView: activeView.home,
                navigateToHome: () {
                  Navigator.pushNamed(context, '/Home', arguments: {
                    'emailID': _emailID,
                    'userName': _userName,
                    'dogName': _dogName
                  });
                },
                navigateToProfile: () async {
                  //TODO: PERRITOS DOG
                  await controller.loadDogFromDB(_emailID, _dogName).then(
                      (dog) => Navigator.pushNamed(context, '/DogProfileInfo',
                              arguments: {
                                'dogModel': dog,
                                'emailID': _emailID,
                                'userName': _userName,
                                'dogName': _dogName
                              }));
                },
                navigateToCalendar: () {
                  Navigator.pushNamed(context, '/Calendar', arguments: {
                    'emailID': _emailID,
                    'userName': _userName,
                    'dogName': _dogName
                  });
                },
              )),
        ));

    var selectedActionScreen = Scaffold(
        backgroundColor: PerritosColor.perritosSnow.color,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 60,
                  right: 10,
                  bottom: 0,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                              child: PerritosIconButton(
                                  onPressed: () => {
                                        controller.switchHomeScreen(
                                            HomeScreen.overview)
                                      },
                                  iconSize: 40,
                                  icon: PerritosIcons.Icon_Arrow_Left)),
                          Text(
                            'Aktionsart',
                            style: perritosDoubleParagon,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "wählen:",
                        style: perritosDoublePica,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PerritosButton(
                          onPressed: () => {
                                controller.selectActionType(ActionType.date),
                                controller
                                    .switchHomeScreen(HomeScreen.createAction)
                              },
                          label: "Termin"),
                      const SizedBox(
                        height: 20,
                      ),
                      PerritosButton(
                          onPressed: () => {
                                controller.selectActionType(ActionType.task),
                                controller
                                    .switchHomeScreen(HomeScreen.createAction)
                              },
                          label: "Aufgabe"),
                      const SizedBox(
                        height: 20,
                      ),
                      _dogName.length < 1
                          ? PerritosButton(
                              onPressed: () => {
                                    controller.selectActionType(
                                        ActionType.abnormality),
                                    controller.switchHomeScreen(
                                        HomeScreen.createAction)
                                  },
                              label: "Auffälligkeit")
                          : Container(),
                      _dogName.length < 1
                          ? const SizedBox(
                              height: 20,
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                      PerritosButton(
                          onPressed: () => {
                                controller.selectActionType(ActionType.walking),
                                controller
                                    .switchHomeScreen(HomeScreen.createAction)
                              },
                          label: "Gassigang"),
                    ]))));
    var createActionScreen = Scaffold(
        backgroundColor: PerritosColor.perritosSnow.color,
        body: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 60,
              right: 10,
              bottom: 60,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                          child: PerritosIconButton(
                              onPressed: () => {
                                    controller.resetActionData(
                                        _userName, _dogName),
                                    controller.switchHomeScreen(
                                        HomeScreen.selectActionType)
                                  },
                              iconSize: 40,
                              icon: PerritosIcons.Icon_Arrow_Left)),
                      Text(
                        model.selectedActionType == ActionType.abnormality
                            ? 'Auffälligkeit'
                            : model.selectedActionType == ActionType.date
                                ? 'Termin'
                                : model.selectedActionType == ActionType.task
                                    ? 'Aufgabe'
                                    : 'Gassigang',
                        style: perritosDoubleParagon,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer()
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              model.selectedActionType != ActionType.walking
                                  ? Column(
                                      children: [
                                        PerritosTxtInput(
                                            label: "Titel",
                                            onSubmit: (title) => {
                                                  controller.changeTitle(title)
                                                }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        PerritosDescriptionInput(
                                            label: "Beschreibung",
                                            onSubmit: (description) => {
                                                  controller.changeDescription(
                                                      description)
                                                }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              model.selectedActionType == ActionType.abnormality
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Gefühlslage:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        PerritosSlider(
                                          value:
                                              model.emotionalState.toDouble(),
                                          onSubmit: (emotionalState) {
                                            controller.changeEmotionalState(
                                                emotionalState);
                                          },
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                              model.selectedActionType == ActionType.date ||
                                      model.selectedActionType ==
                                          ActionType.walking
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Beginn/Ende:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              children: [
                                                PerritosDateTimePicker(
                                                    initDate: model.beginDate,
                                                    initTime: model.beginTime,
                                                    onSubmitDate: (date) => {
                                                          controller
                                                              .changeBeginDate(
                                                                  date)
                                                        },
                                                    onSubmitTime: (time) => {
                                                          controller
                                                              .changeBeginTime(
                                                                  time)
                                                        }),
                                                Text(
                                                  '-',
                                                  style: perritosParagon,
                                                ),
                                                PerritosDateTimePicker(
                                                    initDate: model.endDate,
                                                    initTime: model.endTime,
                                                    onSubmitDate: (date) => {
                                                          controller
                                                              .changeEndDate(
                                                                  date)
                                                        },
                                                    onSubmitTime: (time) => {
                                                          controller
                                                              .changeEndTime(
                                                                  time)
                                                        })
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                              model.selectedActionType != ActionType.abnormality
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Benutzer:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        FutureBuilder(
                                            future: controller
                                                .loadUsersFromDB(_emailID),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<UserModel>>
                                                    snapshot) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                      child: Wrap(
                                                    runSpacing: 10,
                                                    spacing: 10,
                                                    children: [
                                                      for (var user
                                                          in snapshot.data ??
                                                              [])
                                                        PerritosChip(
                                                            disabled:
                                                                !user.selected,
                                                            label: user.name,
                                                            color: user.iconColor ==
                                                                    'perritosBurntSienna'
                                                                ? PerritosColor
                                                                    .perritosBurntSienna
                                                                : user.iconColor ==
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
                                                                            : PerritosColor
                                                                                .perritosCharcoal,
                                                            onPressed: () => user
                                                                    .selected
                                                                ? controller
                                                                    .removeUser(
                                                                        user
                                                                            .name)
                                                                : controller
                                                                    .addUser(user
                                                                        .name)),
                                                    ],
                                                  ))
                                                ],
                                              );
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Hunde:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        FutureBuilder(
                                            future: controller
                                                .loadDogsFromDB(_emailID),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<DogModel>>
                                                    snapshot) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                      child: Wrap(
                                                    runSpacing: 10,
                                                    spacing: 10,
                                                    children: [
                                                      for (var dog
                                                          in snapshot.data ??
                                                              [])
                                                        PerritosChip(
                                                            disabled:
                                                                !dog.selected,
                                                            label: dog.name,
                                                            color: dog.iconColor ==
                                                                    'perritosBurntSienna'
                                                                ? PerritosColor
                                                                    .perritosBurntSienna
                                                                : dog.iconColor ==
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
                                                                            : PerritosColor
                                                                                .perritosCharcoal,
                                                            onPressed: () => dog
                                                                    .selected
                                                                ? controller
                                                                    .removeDog(dog
                                                                        .name)
                                                                : controller
                                                                    .addDog(dog
                                                                        .name)),
                                                    ],
                                                  ))
                                                ],
                                              );
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          ))),
                  PerritosButton(
                      onPressed: () => {
                            controller
                                .createAction(_emailID, _userName, _dogName)
                                .then((m) => {
                                      controller.resetActionData(
                                          _userName, _dogName),
                                      controller
                                          .switchHomeScreen(HomeScreen.overview)
                                    })
                                .catchError((e) => {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Erstellung der Aktion ist fehlgeschlagen :(',
                                                  style: perritosDoublePica),
                                              backgroundColor:
                                                  perritosBurntSienna))
                                    })
                          },
                      label: "erstellen")
                ])));

    var editActionScreen = Scaffold(
        backgroundColor: PerritosColor.perritosSnow.color,
        body: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 60,
              right: 10,
              bottom: 20,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                          child: PerritosIconButton(
                              onPressed: () => {
                                    controller.resetActionData(
                                        _userName, _dogName),
                                    controller
                                        .switchHomeScreen(HomeScreen.overview)
                                  },
                              iconSize: 40,
                              icon: PerritosIcons.Icon_Arrow_Left)),
                      Text(
                        model.selectedActionType == ActionType.abnormality
                            ? 'Auffälligkeit'
                            : model.selectedActionType == ActionType.date
                                ? 'Termin'
                                : model.selectedActionType == ActionType.task
                                    ? 'Aufgabe'
                                    : 'Gassigang',
                        style: perritosDoubleParagon,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer()
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              model.selectedActionType != ActionType.walking
                                  ? Column(
                                      children: [
                                        PerritosTxtInput(
                                            label: "Titel",
                                            initialValue: model.title,
                                            onSubmit: (title) => {
                                                  controller.changeTitle(title)
                                                }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        PerritosDescriptionInput(
                                            label: "Beschreibung",
                                            initialValue: model.description,
                                            onSubmit: (description) => {
                                                  controller.changeDescription(
                                                      description)
                                                }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              model.selectedActionType == ActionType.abnormality
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Gefühlslage:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        PerritosSlider(
                                          value:
                                              model.emotionalState.toDouble(),
                                          onSubmit: (emotionalState) {
                                            controller.changeEmotionalState(
                                                emotionalState);
                                          },
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              model.selectedActionType == ActionType.date ||
                                      model.selectedActionType ==
                                          ActionType.walking
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Beginn/Ende:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              children: [
                                                PerritosDateTimePicker(
                                                    initDate: model.beginDate,
                                                    initTime: model.beginTime,
                                                    onSubmitDate: (date) => {
                                                          controller
                                                              .changeBeginDate(
                                                                  date)
                                                        },
                                                    onSubmitTime: (time) => {
                                                          controller
                                                              .changeBeginTime(
                                                                  time)
                                                        }),
                                                Text(
                                                  '-',
                                                  style: perritosParagon,
                                                ),
                                                PerritosDateTimePicker(
                                                    initDate: model.endDate,
                                                    initTime: model.endTime,
                                                    onSubmitDate: (date) => {
                                                          controller
                                                              .changeEndDate(
                                                                  date)
                                                        },
                                                    onSubmitTime: (time) => {
                                                          controller
                                                              .changeEndTime(
                                                                  time)
                                                        })
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                              model.selectedActionType != ActionType.abnormality
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Benutzer:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        FutureBuilder(
                                            future: controller
                                                .loadUsersFromDB(_emailID),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<UserModel>>
                                                    snapshot) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                      child: Wrap(
                                                    runSpacing: 10,
                                                    spacing: 10,
                                                    children: [
                                                      for (var user
                                                          in snapshot.data ??
                                                              [])
                                                        PerritosChip(
                                                            disabled:
                                                                !user.selected,
                                                            label: user.name,
                                                            color: user.iconColor ==
                                                                    'perritosBurntSienna'
                                                                ? PerritosColor
                                                                    .perritosBurntSienna
                                                                : user.iconColor ==
                                                                        'perritosGoldFusion'
                                                                    ? PerritosColor
                                                                        .perritosGoldFusion
                                                                    : user.iconColor ==
                                                                            'perritosMaizeCrayola'
                                                                        ? PerritosColor
                                                                            .perritosMaizeCrayola
                                                                        : user.iconColor ==
                                                                                'perritosSandyBrown'
                                                                            ? PerritosColor.perritosSandyBrown
                                                                            : PerritosColor.perritosCharcoal,
                                                            onPressed: () => {
                                                                  if (user
                                                                      .selected)
                                                                    {
                                                                      controller
                                                                          .removeUser(
                                                                              user.name)
                                                                    }
                                                                  else
                                                                    {
                                                                      controller
                                                                          .addUser(
                                                                              user.name)
                                                                    }
                                                                }),
                                                    ],
                                                  ))
                                                ],
                                              );
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Hunde:",
                                              style: perritosParagonOpacity,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        FutureBuilder(
                                            future: controller
                                                .loadDogsFromDB(_emailID),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<DogModel>>
                                                    snapshot) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                      child: Wrap(
                                                    runSpacing: 10,
                                                    spacing: 10,
                                                    children: [
                                                      for (var dog
                                                          in snapshot.data ??
                                                              [])
                                                        PerritosChip(
                                                            disabled:
                                                                !dog.selected,
                                                            label: dog.name,
                                                            color: dog.iconColor ==
                                                                    'perritosBurntSienna'
                                                                ? PerritosColor
                                                                    .perritosBurntSienna
                                                                : dog.iconColor ==
                                                                        'perritosGoldFusion'
                                                                    ? PerritosColor
                                                                        .perritosGoldFusion
                                                                    : dog.iconColor ==
                                                                            'perritosMaizeCrayola'
                                                                        ? PerritosColor
                                                                            .perritosMaizeCrayola
                                                                        : dog.iconColor ==
                                                                                'perritosSandyBrown'
                                                                            ? PerritosColor.perritosSandyBrown
                                                                            : PerritosColor.perritosCharcoal,
                                                            onPressed: () => {
                                                                  if (dog
                                                                      .selected)
                                                                    {
                                                                      controller
                                                                          .removeDog(
                                                                              dog.name)
                                                                    }
                                                                  else
                                                                    {
                                                                      controller
                                                                          .addDog(
                                                                              dog.name)
                                                                    }
                                                                }),
                                                    ],
                                                  ))
                                                ],
                                              );
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          ))),
                  PerritosButton(
                      onPressed: () => {
                            controller
                                .updateAction(_dogName)
                                .then((m) => {
                                      controller.resetActionData(
                                          _userName, _dogName),
                                      controller
                                          .switchHomeScreen(HomeScreen.overview)
                                    })
                                .catchError((e) => {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Bearbeitung der Aktion ist fehlgeschlagen :(',
                                                  style: perritosDoublePica),
                                              backgroundColor:
                                                  perritosBurntSienna))
                                    })
                          },
                      label: "bearbeiten"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      PerritosIconButton(
                          label: "löschen",
                          onPressed: () => {
                                controller
                                    .deleteAction()
                                    .then((m) => {
                                          controller.resetActionData(
                                              _userName, _dogName),
                                          controller.switchHomeScreen(
                                              HomeScreen.overview)
                                        })
                                    .catchError((e) => {
                                          print(e),
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Löschen der Aktion ist fehlgeschlagen :(',
                                                      style:
                                                          perritosDoublePica),
                                                  backgroundColor:
                                                      perritosBurntSienna))
                                        })
                              },
                          icon: PerritosIcons.Icon_Remove),
                      const Spacer()
                    ],
                  )
                ])));
    return model.currentScreen == HomeScreen.overview
        ? overviewScreen
        : model.currentScreen == HomeScreen.createAction
            ? createActionScreen
            : model.currentScreen == HomeScreen.editAction
                ? editActionScreen
                : selectedActionScreen;
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);
  void changeSearchString(String searchString);
  void switchHomeScreen(HomeScreen homeScreen);
  void selectActionType(ActionType actionType);
  Future changeCurrentActionId(String actionId);
  void changeTitle(String title);
  void changeDescription(String description);
  void addUser(String user);
  void removeUser(String user);
  void addDog(String dog);
  void removeDog(String dog);
  void changeEmotionalState(double emotionalState);
  void changeBeginDate(DateTime beginDate);
  void changeBeginTime(TimeOfDay beginTime);
  void changeEndDate(DateTime endDate);
  void changeEndTime(TimeOfDay endTime);
  void resetActionData(String userName, List<String> dogName);
  Future createAction(String email, String userName, List<String> dogName);
  Future updateAction(List<String> dogName);
  Future deleteAction();
  Future<DogModel> loadDogFromDB(String email, List<String> dogName);
  Future<List<UserModel>> loadUsersFromDB(String email);
  Future<List<DogModel>> loadDogsFromDB(String email);
  Future<List<ActionDateModel>> loadActionDatesFromDB(
      String email, String userName, List<String> dogName);
  Future<List<ActionTaskModel>> loadActionTasksFromDB(
      String email, String userName, List<String> dogName);
  Future<List<ActionAbnormalityModel>> loadActionAbnormalitiesFromDB(
      String email, String userName, List<String> dogName);
  void setEditActionDatesToModel(ActionDateModel? model);
}
