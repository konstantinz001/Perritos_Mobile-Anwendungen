import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/common/models/action_abnormality_model.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'package:flutter_application/common/models/action_task_model.dart';
import 'package:flutter_application/common/models/action_walking_model.dart';
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

enum DatabaseMessage { success, error }

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required HomeScreen currentScreen,
    required ActionType selectedActionType,
    required String searchString,
    required String currentActionId,
    required String title,
    required String description,
    required List<String> users,
    required List<String> dogs,
    required double emotionalState,
    required Timestamp begin,
    required Timestamp end
  }) = _CalendarModel;
}
