import 'package:flutter/material.dart';
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
    required DateTime beginDate,
    required TimeOfDay beginTime,
    required DateTime endDate,
    required TimeOfDay endTime,
    required 
  }) = _CalendarModel;
}
