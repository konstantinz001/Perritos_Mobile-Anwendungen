import 'package:freezed_annotation/freezed_annotation.dart';

part 'kickoff_model.freezed.dart';

@freezed
class KickoffModel with _$KickoffModel {
  const factory KickoffModel({
    required bool switchTree,
  }) = _KickoffModel;
}
