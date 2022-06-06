// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarModel {
  String get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarModelCopyWith<CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarModelCopyWith<$Res> {
  factory $CalendarModelCopyWith(
          CalendarModel value, $Res Function(CalendarModel) then) =
      _$CalendarModelCopyWithImpl<$Res>;
  $Res call({String username});
}

/// @nodoc
class _$CalendarModelCopyWithImpl<$Res>
    implements $CalendarModelCopyWith<$Res> {
  _$CalendarModelCopyWithImpl(this._value, this._then);

  final CalendarModel _value;
  // ignore: unused_field
  final $Res Function(CalendarModel) _then;

  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CalendarModelCopyWith<$Res>
    implements $CalendarModelCopyWith<$Res> {
  factory _$$_CalendarModelCopyWith(
          _$_CalendarModel value, $Res Function(_$_CalendarModel) then) =
      __$$_CalendarModelCopyWithImpl<$Res>;
  @override
  $Res call({String username});
}

/// @nodoc
class __$$_CalendarModelCopyWithImpl<$Res>
    extends _$CalendarModelCopyWithImpl<$Res>
    implements _$$_CalendarModelCopyWith<$Res> {
  __$$_CalendarModelCopyWithImpl(
      _$_CalendarModel _value, $Res Function(_$_CalendarModel) _then)
      : super(_value, (v) => _then(v as _$_CalendarModel));

  @override
  _$_CalendarModel get _value => super._value as _$_CalendarModel;

  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_$_CalendarModel(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CalendarModel implements _CalendarModel {
  const _$_CalendarModel({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'CalendarModel(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarModel &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      __$$_CalendarModelCopyWithImpl<_$_CalendarModel>(this, _$identity);
}

abstract class _CalendarModel implements CalendarModel {
  const factory _CalendarModel({required final String username}) =
      _$_CalendarModel;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
