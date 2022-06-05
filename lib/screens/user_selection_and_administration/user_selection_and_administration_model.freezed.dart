// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_selection_and_administration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserSelectionAndAdministrationModel {
  UserSelectionAndAdministration
      get currentUserSelectionAndAdministrationScreen =>
          throw _privateConstructorUsedError;
  List<UserModel> get userList => throw _privateConstructorUsedError;
  bool get editable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSelectionAndAdministrationModelCopyWith<
          UserSelectionAndAdministrationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSelectionAndAdministrationModelCopyWith<$Res> {
  factory $UserSelectionAndAdministrationModelCopyWith(
          UserSelectionAndAdministrationModel value,
          $Res Function(UserSelectionAndAdministrationModel) then) =
      _$UserSelectionAndAdministrationModelCopyWithImpl<$Res>;
  $Res call(
      {UserSelectionAndAdministration
          currentUserSelectionAndAdministrationScreen,
      List<UserModel> userList,
      bool editable});
}

/// @nodoc
class _$UserSelectionAndAdministrationModelCopyWithImpl<$Res>
    implements $UserSelectionAndAdministrationModelCopyWith<$Res> {
  _$UserSelectionAndAdministrationModelCopyWithImpl(this._value, this._then);

  final UserSelectionAndAdministrationModel _value;
  // ignore: unused_field
  final $Res Function(UserSelectionAndAdministrationModel) _then;

  @override
  $Res call({
    Object? currentUserSelectionAndAdministrationScreen = freezed,
    Object? userList = freezed,
    Object? editable = freezed,
  }) {
    return _then(_value.copyWith(
      currentUserSelectionAndAdministrationScreen:
          currentUserSelectionAndAdministrationScreen == freezed
              ? _value.currentUserSelectionAndAdministrationScreen
              : currentUserSelectionAndAdministrationScreen // ignore: cast_nullable_to_non_nullable
                  as UserSelectionAndAdministration,
      userList: userList == freezed
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      editable: editable == freezed
          ? _value.editable
          : editable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UserSelectionAndAdministrationModelCopyWith<$Res>
    implements $UserSelectionAndAdministrationModelCopyWith<$Res> {
  factory _$$_UserSelectionAndAdministrationModelCopyWith(
          _$_UserSelectionAndAdministrationModel value,
          $Res Function(_$_UserSelectionAndAdministrationModel) then) =
      __$$_UserSelectionAndAdministrationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserSelectionAndAdministration
          currentUserSelectionAndAdministrationScreen,
      List<UserModel> userList,
      bool editable});
}

/// @nodoc
class __$$_UserSelectionAndAdministrationModelCopyWithImpl<$Res>
    extends _$UserSelectionAndAdministrationModelCopyWithImpl<$Res>
    implements _$$_UserSelectionAndAdministrationModelCopyWith<$Res> {
  __$$_UserSelectionAndAdministrationModelCopyWithImpl(
      _$_UserSelectionAndAdministrationModel _value,
      $Res Function(_$_UserSelectionAndAdministrationModel) _then)
      : super(
            _value, (v) => _then(v as _$_UserSelectionAndAdministrationModel));

  @override
  _$_UserSelectionAndAdministrationModel get _value =>
      super._value as _$_UserSelectionAndAdministrationModel;

  @override
  $Res call({
    Object? currentUserSelectionAndAdministrationScreen = freezed,
    Object? userList = freezed,
    Object? editable = freezed,
  }) {
    return _then(_$_UserSelectionAndAdministrationModel(
      currentUserSelectionAndAdministrationScreen:
          currentUserSelectionAndAdministrationScreen == freezed
              ? _value.currentUserSelectionAndAdministrationScreen
              : currentUserSelectionAndAdministrationScreen // ignore: cast_nullable_to_non_nullable
                  as UserSelectionAndAdministration,
      userList: userList == freezed
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      editable: editable == freezed
          ? _value.editable
          : editable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserSelectionAndAdministrationModel
    implements _UserSelectionAndAdministrationModel {
  const _$_UserSelectionAndAdministrationModel(
      {required this.currentUserSelectionAndAdministrationScreen,
      required final List<UserModel> userList,
      required this.editable})
      : _userList = userList;

  @override
  final UserSelectionAndAdministration
      currentUserSelectionAndAdministrationScreen;
  final List<UserModel> _userList;
  @override
  List<UserModel> get userList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userList);
  }

  @override
  final bool editable;

  @override
  String toString() {
    return 'UserSelectionAndAdministrationModel(currentUserSelectionAndAdministrationScreen: $currentUserSelectionAndAdministrationScreen, userList: $userList, editable: $editable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSelectionAndAdministrationModel &&
            const DeepCollectionEquality().equals(
                other.currentUserSelectionAndAdministrationScreen,
                currentUserSelectionAndAdministrationScreen) &&
            const DeepCollectionEquality().equals(other._userList, _userList) &&
            const DeepCollectionEquality().equals(other.editable, editable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality()
          .hash(currentUserSelectionAndAdministrationScreen),
      const DeepCollectionEquality().hash(_userList),
      const DeepCollectionEquality().hash(editable));

  @JsonKey(ignore: true)
  @override
  _$$_UserSelectionAndAdministrationModelCopyWith<
          _$_UserSelectionAndAdministrationModel>
      get copyWith => __$$_UserSelectionAndAdministrationModelCopyWithImpl<
          _$_UserSelectionAndAdministrationModel>(this, _$identity);
}

abstract class _UserSelectionAndAdministrationModel
    implements UserSelectionAndAdministrationModel {
  const factory _UserSelectionAndAdministrationModel(
      {required final UserSelectionAndAdministration
          currentUserSelectionAndAdministrationScreen,
      required final List<UserModel> userList,
      required final bool editable}) = _$_UserSelectionAndAdministrationModel;

  @override
  UserSelectionAndAdministration
      get currentUserSelectionAndAdministrationScreen =>
          throw _privateConstructorUsedError;
  @override
  List<UserModel> get userList => throw _privateConstructorUsedError;
  @override
  bool get editable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserSelectionAndAdministrationModelCopyWith<
          _$_UserSelectionAndAdministrationModel>
      get copyWith => throw _privateConstructorUsedError;
}
