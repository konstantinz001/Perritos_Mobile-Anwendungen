import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-icon-button.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        child: Column(children: [
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
          const SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: 
                [
                  TableCalendar(
                    locale: 'de',
                    focusedDay: DateTime.now(), 
                    firstDay: DateTime(DateTime.now().year - 10, DateTime.now().month, DateTime.now().day),
                    lastDay: DateTime(DateTime.now().year + 10, DateTime.now().month, DateTime.now().day),
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: PerritosColor.perritosSandyBrown.color,
                        shape: BoxShape.circle
                      ),
                      todayDecoration: BoxDecoration(
                        color: PerritosColor.perritosCharcoal.color.withOpacity(0.6),
                        shape: BoxShape.circle
                      ),
                      todayTextStyle: perritosParagonLight,
                      weekendTextStyle: perritosParagonGoldFusion,
                      defaultTextStyle: perritosParagon,
                      outsideTextStyle:perritosParagonOpacity,
                      
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
                      formatButtonVisible: false
                    ),
                  )     
                ]
              )
            )
          ),
          PerritosNavigationBar(
            activeView: activeView.calendar, 
            navigateToHome: () => {print("go to hme view")}, 
            navigateToCalendar: () => {print("go to calendar view")}, 
            navigateToProfile: () => {print("go to profile view")}
          )
        ],)
      ),
    ));
  }
}

abstract class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state) : super(state);
}
