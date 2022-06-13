import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/common/models/action_task_model.dart';
import 'package:flutter_application/common/models/action_abnormality_model.dart';
import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'home_model.dart';
import 'home_view.dart';
import 'package:flutter_application/common/models/user_model.dart';
import 'package:flutter_application/common/models/dog_model.dart';

class HomeImplmentation extends HomeController {
  final DatabaseService _databaseService;

  HomeImplmentation({
    required String dogName,
    required String userName,
    required String email,
    required DatabaseService databaseService,
    HomeModel? model,
  })  : _databaseService = databaseService,
        super(
          model ??
              HomeModel(
                  currentScreen: HomeScreen.overview,
                  selectedActionType: ActionType.task,
                  currentActionId: "",
                  searchString: "",
                  title: "",
                  description: "",
                  users: [userName],
                  dogs: [dogName],
                  emotionalState: 0,
                  beginDate: DateTime.now(),
                  beginTime: TimeOfDay.now(),
                  endDate: DateTime.now(),
                  endTime: TimeOfDay.fromDateTime(
                      DateTime.now().add(const Duration(hours: 1)))),
        );

  @override
  Future<List<ActionDateModel>> loadActionDatesFromDB(
      String email, String userName, String dogName) async {
    await for (List<ActionDateModel> actionDates
        in _databaseService.getAllActionDates(emailID: email)) {
      if (state.searchString != "") {
        actionDates = actionDates
            .where((action) => action.title
                .toLowerCase()
                .contains(state.searchString.toLowerCase()))
            .toList();
      }
      return actionDates
          .where((action) =>
              action.users.contains(userName) && action.dogs.contains(dogName))
          .toList();
    }
    return List.empty();
  }

  @override
  Future<List<ActionAbnormalityModel>> loadActionAbnormalitiesFromDB(
      String email, String dogName) async {
    await for (List<ActionAbnormalityModel> actionAbnormalities
        in _databaseService.getAllActionAbnormalities(emailID: email)) {
      if (state.searchString != "") {
        actionAbnormalities = actionAbnormalities
            .where((action) => action.title
                .toLowerCase()
                .contains(state.searchString.toLowerCase()))
            .toList();
      }
      return actionAbnormalities
          .where((action) => action.dog == dogName)
          .toList();
    }
    return List.empty();
  }

  @override
  Future<List<ActionTaskModel>> loadActionTasksFromDB(
      String email, String userName, String dogName) async {
    await for (List<ActionTaskModel> actionTasks
        in _databaseService.getAllActionTasks(emailID: email)) {
      if (state.searchString != "") {
        actionTasks = actionTasks
            .where((action) => action.title
                .toLowerCase()
                .contains(state.searchString.toLowerCase()))
            .toList();
      }
      return actionTasks
          .where((action) =>
              action.users.contains(userName) && action.dogs.contains(dogName))
          .toList();
    }
    return List.empty();
  }

  @override
  void changeSearchString(String searchString) {
    state = state.copyWith(searchString: searchString);
  }

  @override
  void switchHomeScreen(HomeScreen homeScreen) {
    state = state.copyWith(currentScreen: homeScreen);
    print(state.currentScreen);
  }

  @override
  void selectActionType(ActionType actionType) {
    state = state.copyWith(selectedActionType: actionType);
  }

  @override
  void addDog(String dog) {
    List<String> newDogs = [...state.dogs];
    newDogs.add(dog);
    state = state.copyWith(dogs: newDogs);
  }

  @override
  void addUser(String user) {
    List<String> newUsers = [...state.users];
    newUsers.add(user);
    state = state.copyWith(users: newUsers);
  }

  @override
  void changeDescription(String description) {
    state = state.copyWith(description: description);
  }

  @override
  void changeEmotionalState(double emotionalState) {
    state = state.copyWith(emotionalState: emotionalState);
  }

  @override
  void changeTitle(String title) {
    state = state.copyWith(title: title);
  }

  @override
  void removeDog(String dog) {
    List<String> newDogs = [...state.dogs];
    newDogs.add(dog);
    state = state.copyWith(dogs: newDogs);
  }

  @override
  void removeUser(String user) {
    List<String> newUsers = [...state.users];
    newUsers.remove(user);
    state = state.copyWith(users: newUsers);
  }

  @override
  Future createAction(String email, String userName, String dogName) async {
    switch (state.selectedActionType) {
      case ActionType.abnormality:
        return await _databaseService.insertActionAbnormaility(
            emailID: email,
            title: state.title,
            description: state.description,
            dog: dogName,
            emotionalState: state.emotionalState.round());
      case ActionType.date:
        return await _databaseService.insertActionDate(
            emailID: email,
            title: state.title,
            description: state.description,
            begin: Timestamp.fromDate(DateTime(
                state.beginDate.year,
                state.beginDate.month,
                state.beginDate.day,
                state.beginTime.hour,
                state.beginTime.minute)),
            end: Timestamp.fromDate(DateTime(
                state.endDate.year,
                state.endDate.month,
                state.endDate.day,
                state.endDate.hour,
                state.endDate.minute)),
            users: state.users,
            dogs: state.dogs);
      case ActionType.task:
        return await _databaseService.insertActionTask(
            emailID: email,
            title: state.title,
            description: state.description,
            users: state.users,
            dogs: state.dogs);
      case ActionType.walking:
        return await _databaseService.insertActionWalking(
            emailID: email,
            begin: Timestamp.fromDate(DateTime(
                state.beginDate.year,
                state.beginDate.month,
                state.beginDate.day,
                state.beginTime.hour,
                state.beginTime.minute)),
            end: Timestamp.fromDate(DateTime(
                state.endDate.year,
                state.endDate.month,
                state.endDate.day,
                state.endDate.hour,
                state.endDate.minute)),
            users: state.users,
            dogs: state.dogs);
    }
  }

  @override
  void resetActionData(String userName, String dogName) {
    state = state.copyWith(
        title: "",
        description: "",
        users: [userName],
        dogs: [dogName],
        emotionalState: 0,
        beginDate: DateTime.now(),
        beginTime: TimeOfDay.now(),
        endDate: DateTime.now(),
        endTime: TimeOfDay(
            hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute));
  }

  @override
  void changeBeginDate(DateTime beginDate) {
    state = state.copyWith(beginDate: beginDate);
  }

  @override
  void changeBeginTime(TimeOfDay beginTime) {
    state = state.copyWith(beginTime: beginTime);
  }

  @override
  void changeEndDate(DateTime endDate) {
    state = state.copyWith(endDate: endDate);
  }

  @override
  void changeEndTime(TimeOfDay endTime) {
    state = state.copyWith(endTime: endTime);
  }

  @override
  Future changeCurrentActionId(String actionId) async {
    state = state.copyWith(currentActionId: actionId);
    switch (state.selectedActionType) {
      case ActionType.abnormality:
        return await _databaseService
            .getActionAbnormalityWithID(actionID: actionId)
            .then((action) => {
                  state = state.copyWith(
                      title: action.title,
                      description: action.description,
                      emotionalState: action.emotionalState.toDouble())
                });
      case ActionType.date:
        return await _databaseService
            .getActionDateWithID(actionID: actionId)
            .then((action) => {
                  state = state.copyWith(
                      title: action.title,
                      description: action.description,
                      beginDate: action.begin.toDate(),
                      beginTime: TimeOfDay.fromDateTime(action.begin.toDate()),
                      endDate: action.end.toDate(),
                      endTime: TimeOfDay.fromDateTime(action.end.toDate()),
                      users: action.users,
                      dogs: action.dogs)
                });
      case ActionType.task:
        return await _databaseService
            .getActionTaskWithID(actionID: actionId)
            .then((action) => {
                  state = state.copyWith(
                      title: action.title,
                      description: action.description,
                      users: action.users,
                      dogs: action.dogs)
                });
      case ActionType.walking:
        return await _databaseService
            .getActionWalkingWithID(actionID: actionId)
            .then((action) => {
                  state = state.copyWith(
                      beginDate: action.begin.toDate(),
                      beginTime: TimeOfDay.fromDateTime(action.begin.toDate()),
                      endDate: action.end.toDate(),
                      endTime: TimeOfDay.fromDateTime(action.end.toDate()),
                      users: action.users,
                      dogs: action.dogs)
                });
    }
  }

  @override
  Future updateAction(String dogName) async {
    switch (state.selectedActionType) {
      case ActionType.abnormality:
        return _databaseService.updateActionAbnormalityWithID(
            actionID: state.currentActionId,
            title: state.title,
            description: state.description,
            dog: dogName,
            emotionalState: state.emotionalState.round());
      case ActionType.date:
        return _databaseService.updateActionDateWithID(
            actionID: state.currentActionId,
            title: state.title,
            description: state.description,
            begin: Timestamp.fromDate(DateTime(
                state.beginDate.year,
                state.beginDate.month,
                state.beginDate.day,
                state.beginTime.hour,
                state.beginTime.minute)),
            end: Timestamp.fromDate(DateTime(
                state.endDate.year,
                state.endDate.month,
                state.endDate.day,
                state.endDate.hour,
                state.endDate.minute)),
            users: state.users,
            dogs: state.dogs);
      case ActionType.task:
        return _databaseService.updateActionTaskWithID(
            actionID: state.currentActionId,
            title: state.title,
            description: state.description,
            users: state.users,
            dogs: state.dogs);
      case ActionType.walking:
        return _databaseService.updateActionWalkingWithID(
            actionID: state.currentActionId,
            begin: Timestamp.fromDate(DateTime(
                state.beginDate.year,
                state.beginDate.month,
                state.beginDate.day,
                state.beginTime.hour,
                state.beginTime.minute)),
            end: Timestamp.fromDate(DateTime(
                state.endDate.year,
                state.endDate.month,
                state.endDate.day,
                state.endDate.hour,
                state.endDate.minute)),
            users: state.users,
            dogs: state.dogs);
    }
  }

  @override
  Future deleteAction() async {
    switch (state.selectedActionType) {
      case ActionType.abnormality:
        return _databaseService.deleteActionAbnormalityWithID(
            actionID: state.currentActionId);
      case ActionType.date:
        return _databaseService.deleteActionDateWithID(
            actionID: state.currentActionId);
      case ActionType.task:
        return _databaseService.deleteActionTaskWithID(
            actionID: state.currentActionId);
      case ActionType.walking:
        return _databaseService.deleteActionWalkingWithID(
            actionID: state.currentActionId);
    }
  }

  //NEW VON K
  @override
  Future<List<UserModel>> loadAllUsersFromDB(String email) async {
    List<UserModel> users = await _databaseService.getAllUsers(emailID: email);
    for (var user in users) {
      if (state.users.contains(user.name)) {
        user.selected = true;
      } else {
        user.selected = false;
      }
    }
    return users.toList();
  }

  @override
  Future<List<DogModel>> loadAllDogsFromDB(String email) async {
    return await _databaseService.getAllDogs(emailID: email);
  }

  @override
  Future<DogModel> loadDogFromDB(String email, String name) async {
    var dogList = await _databaseService.getAllDogs(emailID: email);
    return dogList.firstWhere((dog) => dog.name == name);
  }
}
