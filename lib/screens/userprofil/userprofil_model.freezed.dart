// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'userprofil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfilModel {
  UserProfil get currentUserProfilScreen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfilModelCopyWith<UserProfilModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfilModelCopyWith<$Res> {
  factory $UserProfilModelCopyWith(
          UserProfilModel value, $Res Function(UserProfilModel) then) =
      _$UserProfilModelCopyWithImpl<$Res>;
  $Res call({UserProfil currentUserProfilScreen});
}

/// @nodoc
class _$UserProfilModelCopyWithImpl<$Res>
    implements $UserProfilModelCopyWith<$Res> {
  _$UserProfilModelCopyWithImpl(this._value, this._then);

  final UserProfilModel _value;
  // ignore: unused_field
  final $Res Function(UserProfilModel) _then;

  @override
  $Res call({
    Object? currentUserProfilScreen = freezed,
  }) {
    return _then(_value.copyWith(
      currentUserProfilScreen: currentUserProfilScreen == freezed
          ? _value.currentUserProfilScreen
          : currentUserProfilScreen // ignore: cast_nullable_to_non_nullable
              as UserProfil,
    ));
  }
}

/// @nodoc
abstract class _$$_UserProfilModelCopyWith<$Res>
    implements $UserProfilModelCopyWith<$Res> {
  factory _$$_UserProfilModelCopyWith(
          _$_UserProfilModel value, $Res Function(_$_UserProfilModel) then) =
      __$$_UserProfilModelCopyWithImpl<$Res>;
  @override
  $Res call({UserProfil currentUserProfilScreen});
}

/// @nodoc
class __$$_UserProfilModelCopyWithImpl<$Res>
    extends _$UserProfilModelCopyWithImpl<$Res>
    implements _$$_UserProfilModelCopyWith<$Res> {
  __$$_UserProfilModelCopyWithImpl(
      _$_UserProfilModel _value, $Res Function(_$_UserProfilModel) _then)
      : super(_value, (v) => _then(v as _$_UserProfilModel));

  @override
  _$_UserProfilModel get _value => super._value as _$_UserProfilModel;

  @override
  $Res call({
    Object? currentUserProfilScreen = freezed,
  }) {
    return _then(_$_UserProfilModel(
      currentUserProfilScreen: currentUserProfilScreen == freezed
          ? _value.currentUserProfilScreen
          : currentUserProfilScreen // ignore: cast_nullable_to_non_nullable
              as UserProfil,
    ));
  }
}

/// @nodoc

class _$_UserProfilModel implements _UserProfilModel {
  const _$_UserProfilModel({required this.currentUserProfilScreen});

  @override
  final UserProfil currentUserProfilScreen;

  @override
  String toString() {
    return 'UserProfilModel(currentUserProfilScreen: $currentUserProfilScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfilModel &&
            const DeepCollectionEquality().equals(
                other.currentUserProfilScreen, currentUserProfilScreen));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(currentUserProfilScreen));

  @JsonKey(ignore: true)
  @override
  _$$_UserProfilModelCopyWith<_$_UserProfilModel> get copyWith =>
      __$$_UserProfilModelCopyWithImpl<_$_UserProfilModel>(this, _$identity);
}

abstract class _UserProfilModel implements UserProfilModel {
  const factory _UserProfilModel(
      {required final UserProfil currentUserProfilScreen}) = _$_UserProfilModel;

  @override
  UserProfil get currentUserProfilScreen => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfilModelCopyWith<_$_UserProfilModel> get copyWith =>
      throw _privateConstructorUsedError;
}
