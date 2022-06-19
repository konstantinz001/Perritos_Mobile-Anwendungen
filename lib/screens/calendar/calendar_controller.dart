import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/common/models/users/dog_model.dart';
import 'package:flutter_application/common/models/users/user_model.dart';
import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/common/models/actions/action_date_model.dart';
import 'package:flutter_application/screens/calendar/calendar_model.dart';
import 'package:intl/intl.dart';
import 'calendar_view.dart';

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
  Future<Map<DateTime, List<ActionDateModel>>> loadEvents(
      String email, String userName, List<String> dogName) async {
    List<ActionDateModel> actionDates =
        await loadActionDatesFromDB(email, userName, dogName);

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
  Future<List<ActionDateModel>> loadActionDatesFromDB(
      String email, String userName, List<String> dogName) async {
    var actionDates = await _databaseService.getAllActionDates(emailID: email);
    List<ActionDateModel> returnAction = List.empty(growable: true);

    dogName.forEach((dog) {
      returnAction.addAll(actionDates
          .where((action) =>
              action.users.contains(userName) && action.dogs.contains(dog))
          .toList());
    });
    return returnAction.toSet().toList();
  }

  @override
  Future<List<UserModel>> loadAllUsersFromDB(String email) async {
    return await _databaseService.getAllUsers(emailID: email);
  }

  @override
  Future<List<DogModel>> loadAllDogsFromDB(String email) async {
    return await _databaseService.getAllDogs(emailID: email);
  }

  @override
  Future<DogModel> loadDogFromDB(String email, List<String> dogName) async {
    if (dogName.length <= 1) {
      var dogList = await _databaseService.getAllDogs(emailID: email);
      try {
        return dogList.firstWhere((dog) => dog.name == dogName[0]);
      } catch (e) {
        return DogModel(
            email, "Perritos", false, "", "", "", Timestamp.now(), "");
      }
    } else {
      return DogModel(
          email, "Perritos", false, "", "", "", Timestamp.now(), "");
    }
  }
}
