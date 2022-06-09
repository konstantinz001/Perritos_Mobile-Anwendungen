import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/common/models/action_task_model.dart';
import 'package:flutter_application/common/models/action_abnormality_model.dart';
import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'home_model.dart';
import 'home_view.dart';

const userName = "Alex";
const dogName = "dog1";
const email = "test@gmail.com";

class HomeImplmentation extends HomeController {
  final DatabaseService _databaseService;

  HomeImplmentation({
    required DatabaseService databaseService,
    HomeModel? model,
  })  : _databaseService = databaseService,
        super(model ??
            HomeModel(
                currentScreen: HomeScreen.overview,
                selectedActionType: ActionType.task,
                currentActionId: "",
                searchString: "",
                title: "",
                description: "",
                users: ["user1", "user2", "user3", "user3", "user3", "user3"],
                dogs: [],
                emotionalState: 0,
                begin: Timestamp.now(),
                end: Timestamp.now()
              ),
            );

  @override
  Future<List<ActionDateModel>> loadActionDatesFromDB() async {
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
  Future<List<ActionAbnormalityModel>> loadActionAbnormalitiesFromDB() async {
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
  Future<List<ActionTaskModel>> loadActionTasksFromDB() async {
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
  }

  @override
  void selectActionType(ActionType actionType) {
    state = state.copyWith(selectedActionType: actionType);
  }
}
