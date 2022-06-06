import 'package:flutter/material.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calendar_model.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarController controller =
        ref.read(providers.calendarControllerProvider.notifier);
    final CalendarModel model =
        ref.watch(providers.calendarControllerProvider);

    return const Scaffold(body: Center(child: Text('Calendar Screen')));
    
  }
}

abstract class CalendarController
        extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state)
      : super(state);
}
