// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dog_profile_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DogProfileModel {
  DogModel get dog => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DogProfileModelCopyWith<DogProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogProfileModelCopyWith<$Res> {
  factory $DogProfileModelCopyWith(
          DogProfileModel value, $Res Function(DogProfileModel) then) =
      _$DogProfileModelCopyWithImpl<$Res>;
  $Res call({DogModel dog});
}

/// @nodoc
class _$DogProfileModelCopyWithImpl<$Res>
    implements $DogProfileModelCopyWith<$Res> {
  _$DogProfileModelCopyWithImpl(this._value, this._then);

  final DogProfileModel _value;
  // ignore: unused_field
  final $Res Function(DogProfileModel) _then;

  @override
  $Res call({
    Object? dog = freezed,
  }) {
    return _then(_value.copyWith(
      dog: dog == freezed
          ? _value.dog
          : dog // ignore: cast_nullable_to_non_nullable
              as DogModel,
    ));
  }
}

/// @nodoc
abstract class _$$_DogProfileModelCopyWith<$Res>
    implements $DogProfileModelCopyWith<$Res> {
  factory _$$_DogProfileModelCopyWith(
          _$_DogProfileModel value, $Res Function(_$_DogProfileModel) then) =
      __$$_DogProfileModelCopyWithImpl<$Res>;
  @override
  $Res call({DogModel dog});
}

/// @nodoc
class __$$_DogProfileModelCopyWithImpl<$Res>
    extends _$DogProfileModelCopyWithImpl<$Res>
    implements _$$_DogProfileModelCopyWith<$Res> {
  __$$_DogProfileModelCopyWithImpl(
      _$_DogProfileModel _value, $Res Function(_$_DogProfileModel) _then)
      : super(_value, (v) => _then(v as _$_DogProfileModel));

  @override
  _$_DogProfileModel get _value => super._value as _$_DogProfileModel;

  @override
  $Res call({
    Object? dog = freezed,
  }) {
    return _then(_$_DogProfileModel(
      dog: dog == freezed
          ? _value.dog
          : dog // ignore: cast_nullable_to_non_nullable
              as DogModel,
    ));
  }
}

/// @nodoc

class _$_DogProfileModel implements _DogProfileModel {
  const _$_DogProfileModel({required this.dog});

  @override
  final DogModel dog;

  @override
  String toString() {
    return 'DogProfileModel(dog: $dog)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DogProfileModel &&
            const DeepCollectionEquality().equals(other.dog, dog));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(dog));

  @JsonKey(ignore: true)
  @override
  _$$_DogProfileModelCopyWith<_$_DogProfileModel> get copyWith =>
      __$$_DogProfileModelCopyWithImpl<_$_DogProfileModel>(this, _$identity);
}

abstract class _DogProfileModel implements DogProfileModel {
  const factory _DogProfileModel({required final DogModel dog}) =
      _$_DogProfileModel;

  @override
  DogModel get dog => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DogProfileModelCopyWith<_$_DogProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
