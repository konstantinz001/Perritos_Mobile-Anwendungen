import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';

enum HomeScreen {
  overview,
  selectActionType,
  createAction,
  editAction
}
enum ActionType {
  abnormality,
  date,
  task,
  walking
}

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required HomeScreen currentScreen,
    required ActionType selectedActionType
  }) = _CalendarModel;
}
