import 'package:flutter_application/common/models/users/dog_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'dog_profile_info_model.freezed.dart';

enum DatabaseMessage { success, error }
enum WeekDay { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

@freezed
class DogProfileModel with _$DogProfileModel {
  const factory DogProfileModel({
    required DogModel dog,
    }) = _DogProfileModel;
}