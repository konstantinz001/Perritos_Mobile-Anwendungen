import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/models/dog_model.dart';

part 'dog_profile_info_model.freezed.dart';

enum DatabaseMessage { success, error }

@freezed
class DogProfileModel with _$DogProfileModel {
  const factory DogProfileModel({
    required DogModel dog,
    }) = _DogProfileModel;
}