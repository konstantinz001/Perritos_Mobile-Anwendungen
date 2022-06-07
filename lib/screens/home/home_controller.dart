import 'package:flutter_application/screens/home/home_model.dart';
import 'home_view.dart';

class HomeImplementation extends HomeController {

  HomeImplementation({HomeModel? model,})
      : super(model ?? const HomeModel(currentHomeScreen: Home.actionsOverview));

  @override
  void switchHomeScreen(screen) {
    state = state.copyWith(currentHomeScreen: screen);
  }
}