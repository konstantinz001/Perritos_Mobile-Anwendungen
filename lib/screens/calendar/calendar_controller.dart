import 'package:flutter_application/models/action_date_model.dart';
import 'package:flutter_application/screens/calendar/calendar_model.dart';
import 'package:intl/intl.dart';
import 'calendar_view.dart';

class CalendarImplmentation extends CalendarController {
  CalendarImplmentation({
    CalendarModel? model,
  }) : super(model ??
            CalendarModel(
                selectedDay: DateTime.parse(
                    "${DateFormat("yyyy-MM-dd").format(DateTime.now())} 00:00:00.000Z"),
                focusedDay: DateTime.parse(
                    "${DateFormat("yyyy-MM-dd").format(DateTime.now())} 00:00:00.000Z"),
                selectedEvents: {
                  DateTime.parse("2022-06-09 00:00:00.000Z"): [
                    ActionDateModel(
                      "Arzt Besuch",
                      "Tierarzt Praxis Lümmel",
                      DateTime(2022, 7, 8, 17, 30),
                      DateTime(2022, 7, 8, 18, 30),
                      ["user1", "user2"],
                      ["dog1", "dog2"],
                    ),
                    ActionDateModel(
                      "Impfung",
                      "Tierarzt Praxis Lümmel",
                      DateTime(2022, 7, 8, 17, 30),
                      DateTime(2022, 7, 8, 18, 30),
                      ["user1", "user2"],
                      ["dog1", "dog2"],
                    ),
                  ]
                }));

  @override
  List<ActionDateModel> getEventsfromDay(DateTime date) {
    return state.selectedEvents[date] ?? [];
  }

  @override
  void changeFocusedDay(DateTime date) {
    state = state.copyWith(focusedDay: date);
  }

  @override
  void changeSelectedDay(DateTime date) {
    state = state.copyWith(selectedDay: date);
  }
}
