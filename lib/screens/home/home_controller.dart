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
}
