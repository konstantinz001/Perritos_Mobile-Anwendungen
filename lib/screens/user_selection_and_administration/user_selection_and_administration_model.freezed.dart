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
  String get userName => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColor => throw _privateConstructorUsedError;

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
      bool editable,
      String userName,
      String iconName,
      String iconColor});
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
    Object? userName = freezed,
    Object? iconName = freezed,
    Object? iconColor = freezed,
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
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColor: iconColor == freezed
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String,
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
      bool editable,
      String userName,
      String iconName,
      String iconColor});
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
    Object? userName = freezed,
    Object? iconName = freezed,
    Object? iconColor = freezed,
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
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColor: iconColor == freezed
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserSelectionAndAdministrationModel
    implements _UserSelectionAndAdministrationModel {
  const _$_UserSelectionAndAdministrationModel(
      {required this.currentUserSelectionAndAdministrationScreen,
      required final List<UserModel> userList,
      required this.editable,
      required this.userName,
      required this.iconName,
      required this.iconColor})
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
  final String userName;
  @override
  final String iconName;
  @override
  final String iconColor;

  @override
  String toString() {
    return 'UserSelectionAndAdministrationModel(currentUserSelectionAndAdministrationScreen: $currentUserSelectionAndAdministrationScreen, userList: $userList, editable: $editable, userName: $userName, iconName: $iconName, iconColor: $iconColor)';
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
            const DeepCollectionEquality().equals(other.editable, editable) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.iconName, iconName) &&
            const DeepCollectionEquality().equals(other.iconColor, iconColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality()
          .hash(currentUserSelectionAndAdministrationScreen),
      const DeepCollectionEquality().hash(_userList),
      const DeepCollectionEquality().hash(editable),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(iconName),
      const DeepCollectionEquality().hash(iconColor));

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
          required final bool editable,
          required final String userName,
          required final String iconName,
          required final String iconColor}) =
      _$_UserSelectionAndAdministrationModel;

  @override
  UserSelectionAndAdministration
      get currentUserSelectionAndAdministrationScreen =>
          throw _privateConstructorUsedError;
  @override
  List<UserModel> get userList => throw _privateConstructorUsedError;
  @override
  bool get editable => throw _privateConstructorUsedError;
  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get iconName => throw _privateConstructorUsedError;
  @override
  String get iconColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserSelectionAndAdministrationModelCopyWith<
          _$_UserSelectionAndAdministrationModel>
      get copyWith => throw _privateConstructorUsedError;
}
