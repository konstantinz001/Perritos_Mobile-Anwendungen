import 'package:flutter_application/common/models/action_walking_model.dart';
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
            const HomeModel(
              currentScreen: HomeScreen.overview,
              selectedActionType: ActionType.task
            )      
            );

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

  @override
  Future<List<ActionAbnormalityModel>> loadActionAbnormalitiesFromDB() async {
    await for (List<ActionAbnormalityModel> actionAbnormalities
        in _databaseService.getAllActionAbnormalities(emailID: email)) {
      return actionAbnormalities
          .where((action) =>
              action.dog == dogName)
          .toList();
    }
    return List.empty();
  }

  @override
  Future<List<ActionTaskModel>> loadActionTasksFromDB() async {
    await for (List<ActionTaskModel> actionTasks
        in _databaseService.getAllActionTasks(emailID: email)) {
      return actionTasks
          .where((action) =>
              action.users.contains(userName) && action.dogs.contains(dogName))
          .toList();
    }
    return List.empty();
  }
}
