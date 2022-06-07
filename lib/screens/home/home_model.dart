import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_model.freezed.dart';

enum Home {
  actionsOverview,
  actionsOverviewAll,
  selectActionType,
  createActionTask,
  editActionTask,
  createActionAnormality,
  editActionAnormality,
  createActionAppointment,
  editActionAppointment,
  createActionGassi
}

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required Home currentHomeScreen,
  }) = _HomeModel;


}