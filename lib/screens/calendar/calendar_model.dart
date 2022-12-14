import 'package:flutter_application/common/models/actions/action_date_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';

@freezed
class CalendarModel with _$CalendarModel {
  const factory CalendarModel(
      {required DateTime selectedDay,
      required DateTime focusedDay,
      required Map<DateTime, List<ActionDateModel>> events}) = _CalendarModel;
}
