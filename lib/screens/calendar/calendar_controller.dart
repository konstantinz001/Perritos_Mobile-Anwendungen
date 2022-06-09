import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'package:flutter_application/screens/calendar/calendar_model.dart';
import 'package:intl/intl.dart';
import 'calendar_view.dart';

const userName = "Alex";
const dogName = "dog1";
const email = "k@web.de";

class CalendarImplmentation extends CalendarController {
  final DatabaseService _databaseService;

  CalendarImplmentation({
    required DatabaseService databaseService,
    CalendarModel? model,
  })  : _databaseService = databaseService,
        super(model ??
            CalendarModel(
                selectedDay: DateTime.parse(
                    "${DateFormat("yyyy-MM-dd").format(DateTime.now())} 00:00:00.000Z"),
                focusedDay: DateTime.parse(
                    "${DateFormat("yyyy-MM-dd").format(DateTime.now())} 00:00:00.000Z"),
                events: {}));

  @override
  List<ActionDateModel> getEventsfromDay(DateTime date) {
    return state.events[date] ?? [];
  }

  @override
  void changeFocusedDay(DateTime date) {
    state = state.copyWith(focusedDay: date);
  }

  @override
  void changeSelectedDay(DateTime date) {
    state = state.copyWith(selectedDay: date);
  }

  @override
  Future<Map<DateTime, List<ActionDateModel>>> loadEvents() async {
    List<ActionDateModel> actionDates = await loadActionDatesFromDB();
    Map<DateTime, List<ActionDateModel>> events = {};
    for (var action in actionDates) {
      DateTime key = DateTime.parse(
          "${DateFormat("yyyy-MM-dd").format(action.begin.toDate())} 00:00:00.000Z");
      if (events.containsKey(key)) {
        events.update(
            key,
            (List<ActionDateModel> actionList) =>
                List.from(actionList.toList())..add(action));
      } else {
        events[key] = [action];
      }
    }
    state = state.copyWith(events: events);
    return events;
  }

  @override
  Future<List<ActionDateModel>> loadActionDatesFromDB() async {
    await for (List<ActionDateModel> actionDates
        in _databaseService.getAllActionDates(emailID: email)) {
      return actionDates
          .where((action) =>
              action.users.contains(userName) && action.dogs.contains(dogName))
          .toList();
    }
    return List.empty();
  }
}
