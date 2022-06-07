import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/action/perritos-action.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-icon-button.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/models/action_date_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_model.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarController controller =
        ref.read(providers.calendarControllerProvider.notifier);
    final CalendarModel model = ref.watch(providers.calendarControllerProvider);

    return Scaffold(
        body: Container(
      color: PerritosColor.perritosSnow.color,
      child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  PerritosIconButton(
                    onPressed: () =>
                        {print("go to dog-selection-and-administration view")},
                    icon: PerritosIcons.Icon_Dog,
                    iconSize: 26,
                  ),
                  const Spacer(),
                  PerritosIconButton(
                    onPressed: () =>
                        {print("go to user-selection-and-administration view")},
                    icon: PerritosIcons.Icon_User,
                    iconSize: 26,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(children: [
                TableCalendar(
                  eventLoader: controller.getEventsfromDay,
                  locale: 'de',
                  focusedDay: model.focusedDay,
                  firstDay: DateTime(DateTime.now().year - 10,
                      DateTime.now().month, DateTime.now().day),
                  lastDay: DateTime(DateTime.now().year + 10,
                      DateTime.now().month, DateTime.now().day),
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    controller.changeSelectedDay(selectDay);
                    controller.changeFocusedDay(focusDay);
                  },
                  selectedDayPredicate: (day) =>isSameDay(day, model.selectedDay),
                  onRangeSelected:
                      (DateTime? start, DateTime? end, DateTime focusedDay) {
                    controller.changeFocusedDay(focusedDay);
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                        color: PerritosColor.perritosMaizeCrayola.color,
                        shape: BoxShape.circle),
                    todayDecoration: BoxDecoration(
                        color: PerritosColor.perritosGoldFusion.color
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
                    selectedTextStyle: perritosParagonLight
                  ),
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
                      (ActionDateModel event) => 
                      PerritosAction(
                      icon: PerritosIcons.Icon_Date,
                      label: event.title,
                      value: '${DateFormat("dd.mm.yyyy hh:mm").format(event.begin)} bis ${DateFormat("dd.mm.yyyy hh:mm").format(event.end)}' ,
                      onPressed: () => {})
                    ),
              ]))),
              PerritosNavigationBar(
                  activeView: activeView.calendar,
                  navigateToHome: () => {},
                  navigateToCalendar: () => {},
                  navigateToProfile: () => {})
            ],
          )),
    ));
  }
}

abstract class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state) : super(state);
  List<ActionDateModel> getEventsfromDay(DateTime date);
  void changeSelectedDay(DateTime date);
  void changeFocusedDay(DateTime date);
}