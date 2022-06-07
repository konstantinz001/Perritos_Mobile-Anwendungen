import 'package:flutter_application/models/action_date_model.dart';
import 'package:flutter_application/screens/calendar/calendar_model.dart';
import 'package:intl/intl.dart';
import 'calendar_view.dart';

//(.....,Startdatum, Enddatum)
var actionDates = {
  DateTime.parse(
      "${DateFormat("yyyy-MM-dd").format(DateTime.now())} 00:00:00.000Z"): [
    ActionDateModel(
      "Impfung",
      "Tierarzt Praxis Lümmel",
      DateTime(2022, 7, 8, 17, 30),
      DateTime(2022, 7, 8, 18, 30),
      ["user1", "user2"],
      ["dog1", "dog2"],
    ),
    ActionDateModel(
      "Arzt",
      "Tierarzt Praxis Lümmel",
      DateTime(2022, 7, 12, 17, 30),
      DateTime(2022, 7, 14, 18, 30),
      ["user1", "user2"],
      ["dog1", "dog2"],
    ),
    ActionDateModel(
      "Gassi mit Kumpel",
      "im Park",
      DateTime(2022, 7, 20, 17, 30),
      DateTime(2022, 7, 20, 18, 30),
      ["user1", "user2"],
      ["dog1", "dog2"],
    ),
  ]
};
var actionDates1 = {
  DateTime.parse(
      "${DateFormat("yyyy-MM-dd").format(DateTime(2022, 7, 8, 17, 30))} 00:00:00.000Z"): [
    ActionDateModel(
      "Impfung",
      "Tierarzt Praxis Lümmel",
      DateTime(2022, 7, 8, 17, 30),
      DateTime(2022, 7, 8, 18, 30),
      ["user1", "user2"],
      ["dog1", "dog2"],
    ),
    ActionDateModel(
      "Arzt",
      "Tierarzt Praxis Lümmel",
      DateTime(2022, 7, 12, 17, 30),
      DateTime(2022, 7, 14, 18, 30),
      ["user1", "user2"],
      ["dog1", "dog2"],
    ),
    ActionDateModel(
      "Gassi mit Kumpel",
      "im Park",
      DateTime(2022, 7, 20, 17, 30),
      DateTime(2022, 7, 20, 18, 30),
      ["user1", "user2"],
      ["dog1", "dog2"],
    ),
  ]
};

class CalendarImplmentation extends CalendarController {
  CalendarImplmentation({
    CalendarModel? model,
  }) : super(model ??
            CalendarModel(
                selectedDay: DateTime.parse(
                    "${DateFormat("yyyy-MM-dd").format(DateTime.now())} 00:00:00.000Z"),
                focusedDay: DateTime.parse(
                    "${DateFormat("yyyy-MM-dd").format(DateTime.now())} 00:00:00.000Z"),
                selectedEvents: new Map.from(actionDates)
                  ..addAll(actionDates1)));

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
