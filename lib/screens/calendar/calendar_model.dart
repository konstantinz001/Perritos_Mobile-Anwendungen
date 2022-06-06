import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';

@freezed
class CalendarModel with _$CalendarModel {
  const factory CalendarModel({
    required String username,
  }) = _CalendarModel;
}
