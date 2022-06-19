import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/action/perritos-action.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/common/models/users/dog_model.dart';
import 'package:flutter_application/common/models/users/user_model.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/common/models/actions/action_date_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_model.dart';

class CalendarView extends ConsumerWidget {
  final String _emailID;
  final String _userName;
  final List<String> _dogName;
  final bool? _perritos;
  final DogModel? _selectedDog;
  final UserModel? _selectedUser;

  const CalendarView(
      {Key? key,
      required List<String> dogName,
      required String emailID,
      required String userName,
      required bool? perritos,
      required UserModel? selectedUser,
      required DogModel? selectedDog})
      : _dogName = dogName,
        _emailID = emailID,
        _userName = userName,
        _perritos = perritos,
        _selectedDog = selectedDog,
        _selectedUser = selectedUser,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarController controller =
        ref.read(providers.calendarControllerProvider.notifier);
    final CalendarModel model = ref.watch(providers.calendarControllerProvider);

    return Scaffold(
        body: Container(
            color: PerritosColor.perritosSnow.color,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async => {
                        await controller
                            .loadAllDogsFromDB(_emailID)
                            .then((dogList) => {
                                  Navigator.pushNamed(
                                      context, "/DogSelectionAndAdministration",
                                      arguments: {
                                        'emailID': _emailID,
                                        'userName': _userName,
                                        'dogList': dogList
                                      })
                                })
                      },
                      icon: Icon(
                        _perritos == true
                            ? PerritosIcons.Icon_Perritos
                            : _selectedDog?.iconName == 'Icon_Smiley_Happy'
                                ? PerritosIcons.Icon_Smiley_Happy
                                : _selectedDog?.iconName == 'Icon_Smiley_Sad'
                                    ? PerritosIcons.Icon_Smiley_Sad
                                    : PerritosIcons.Icon_Dog,
                        size: 26,
                        color: _perritos == true
                            ? PerritosColor.perritosCharcoal.color
                            : _selectedDog?.iconColor == 'perritosGoldFusion'
                                ? PerritosColor.perritosGoldFusion.color
                                : _selectedDog?.iconColor ==
                                        'perritosMaizeCrayola'
                                    ? PerritosColor.perritosMaizeCrayola.color
                                    : _selectedDog?.iconColor ==
                                            'perritosSandyBrown'
                                        ? PerritosColor.perritosSandyBrown.color
                                        : _selectedDog?.iconColor ==
                                                'perritosBurntSienna'
                                            ? PerritosColor
                                                .perritosBurntSienna.color
                                            : PerritosColor
                                                .perritosCharcoal.color,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async => {
                        await controller
                            .loadAllUsersFromDB(_emailID)
                            .then((userList) => {
                                  Navigator.pushNamed(context,
                                      '/UserSelectionAndAdministration',
                                      arguments: {
                                        'emailID': _emailID,
                                        'userList': userList
                                      })
                                })
                      },
                      icon: Icon(
                        _selectedUser?.iconName == 'Icon_Smiley_Happy'
                            ? PerritosIcons.Icon_Smiley_Happy
                            : _selectedUser?.iconName == 'Icon_Smiley_Sad'
                                ? PerritosIcons.Icon_Smiley_Sad
                                : PerritosIcons.Icon_User,
                        size: 26,
                        color: _selectedUser?.iconColor == 'perritosGoldFusion'
                            ? PerritosColor.perritosGoldFusion.color
                            : _selectedUser?.iconColor == 'perritosMaizeCrayola'
                                ? PerritosColor.perritosMaizeCrayola.color
                                : _selectedUser?.iconColor ==
                                        'perritosSandyBrown'
                                    ? PerritosColor.perritosSandyBrown.color
                                    : _selectedUser?.iconColor ==
                                            'perritosBurntSienna'
                                        ? PerritosColor
                                            .perritosBurntSienna.color
                                        : PerritosColor.perritosCharcoal.color,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 10,
                      bottom: 30,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                            child: Column(children: [
                          TableCalendar(
                            eventLoader: controller.getEventsfromDay,
                            onPageChanged: (DateTime focusedDate) {
                              controller.changeFocusedDay(focusedDate);
                            },
                            locale: 'de',
                            focusedDay: model.focusedDay,
                            firstDay: DateTime(DateTime.now().year - 10,
                                DateTime.now().month, DateTime.now().day),
                            lastDay: DateTime(DateTime.now().year + 10,
                                DateTime.now().month, DateTime.now().day),
                            onDaySelected:
                                (DateTime selectDay, DateTime focusDay) {
                              controller.changeSelectedDay(selectDay);
                              controller.changeFocusedDay(focusDay);
                            },
                            selectedDayPredicate: (day) =>
                                isSameDay(day, model.selectedDay),
                            onRangeSelected: (DateTime? start, DateTime? end,
                                DateTime focusedDay) {
                              controller.changeFocusedDay(focusedDay);
                            },
                            calendarStyle: CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                    color: PerritosColor
                                        .perritosMaizeCrayola.color,
                                    shape: BoxShape.circle),
                                todayDecoration: BoxDecoration(
                                    color: PerritosColor
                                        .perritosGoldFusion.color
                                        .withOpacity(0.6),
                                    shape: BoxShape.circle),
                                rangeStartDecoration: const BoxDecoration(
                                  color: perritosBurntSienna,
                                  shape: BoxShape.circle,
                                ),
                                rangeEndDecoration: const BoxDecoration(
                                  color: perritosBurntSienna,
                                  shape: BoxShape.circle,
                                ),
                                markerDecoration: const BoxDecoration(
                                  color: perritosCharcoal,
                                  shape: BoxShape.circle,
                                ),
                                todayTextStyle: perritosParagonLight,
                                weekendTextStyle: perritosParagonGoldFusion,
                                defaultTextStyle: perritosParagon,
                                outsideTextStyle: perritosParagonOpacity,
                                selectedTextStyle: perritosParagonLight),
                            headerStyle: HeaderStyle(
                                titleTextStyle: perritosDoublePica,
                                titleCentered: true,
                                leftChevronIcon: Icon(
                                  PerritosIcons.Icon_Arrow_Left,
                                  size: 16,
                                  color: PerritosColor.perritosCharcoal.color,
                                ),
                                rightChevronIcon: Icon(
                                  PerritosIcons.Icon_Arrow_Right,
                                  size: 16,
                                  color: PerritosColor.perritosCharcoal.color,
                                ),
                                formatButtonVisible: false),
                          ),
                          ...controller.getEventsfromDay(model.selectedDay).map(
                              (ActionDateModel event) => PerritosAction(
                                  icon: PerritosIcons.Icon_Date,
                                  label: event.title,
                                  value:
                                      '${DateFormat("dd.mm.yyyy hh:mm").format(event.begin.toDate())} bis ${DateFormat("dd.mm.yyyy hh:mm").format(event.end.toDate())}',
                                  onPressed: () => {
                                        Navigator.pushNamed(context, '/Home',
                                            arguments: {
                                              'emailID': _emailID,
                                              'userName': _userName,
                                              'dogName': _dogName,
                                              'dateModel': event,
                                              'comingFromCalendar': true,
                                              'perritos': _perritos,
                                              'selectedUser': _selectedUser,
                                              'selectedDog': _selectedDog
                                            })
                                      })),
                          FutureBuilder(
                              future: controller.loadEvents(
                                  _emailID, _userName, _dogName),
                              builder: (BuildContext context,
                                  AsyncSnapshot<
                                          Map<DateTime, List<ActionDateModel>>>
                                      snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const SizedBox();
                                } else {
                                  if (snapshot.hasError) {
                                    return Text(
                                      'Error: ${snapshot.error}',
                                      style: perritosParagonError,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                }
                              })
                        ])),
                      ],
                    )),
              ],
            )),
        bottomNavigationBar: Container(
            color: PerritosColor.perritosSnow.color,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 10, right: 10, bottom: 30),
                child: PerritosNavigationBar(
                  activeView: activeView.calendar,
                  navigateToHome: () {
                    Navigator.pushNamed(context, '/Home', arguments: {
                      'emailID': _emailID,
                      'userName': _userName,
                      'dogName': _dogName,
                      'perritos': _perritos,
                      'selectedUser': _selectedUser,
                      'selectedDog': _selectedDog
                    });
                  },
                  navigateToProfile: () async {
                    await controller.loadDogFromDB(_emailID, _dogName).then(
                        (dog) => Navigator.pushNamed(context, '/DogProfileInfo',
                                arguments: {
                                  'dogModel': dog,
                                  'emailID': _emailID,
                                  'userName': _userName,
                                  'dogName': _dogName,
                                  'selectedUser': _selectedUser,
                                  'selectedDog': _selectedDog
                                }));
                  },
                  navigateToCalendar: () {},
                ))));
  }
}

abstract class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state) : super(state);
  List<ActionDateModel> getEventsfromDay(DateTime date);
  void changeSelectedDay(DateTime date);
  void changeFocusedDay(DateTime date);
  Future<List<ActionDateModel>> loadActionDatesFromDB(
      String email, String userName, List<String> dogName);
  Future<Map<DateTime, List<ActionDateModel>>> loadEvents(
      String email, String userName, List<String> dogName);

  Future<List<UserModel>> loadAllUsersFromDB(String email);
  Future<List<DogModel>> loadAllDogsFromDB(String email);
  Future<DogModel> loadDogFromDB(String email, List<String> name);
}
