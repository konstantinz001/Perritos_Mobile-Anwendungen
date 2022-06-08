// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeModel {
  HomeScreen get currentScreen => throw _privateConstructorUsedError;
  ActionType get selectedActionType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res>;
  $Res call({HomeScreen currentScreen, ActionType selectedActionType});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  final HomeModel _value;
  // ignore: unused_field
  final $Res Function(HomeModel) _then;

  @override
  $Res call({
    Object? currentScreen = freezed,
    Object? selectedActionType = freezed,
  }) {
    return _then(_value.copyWith(
      currentScreen: currentScreen == freezed
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as HomeScreen,
      selectedActionType: selectedActionType == freezed
          ? _value.selectedActionType
          : selectedActionType // ignore: cast_nullable_to_non_nullable
              as ActionType,
    ));
  }
}

/// @nodoc
abstract class _$$_CalendarModelCopyWith<$Res>
    implements $HomeModelCopyWith<$Res> {
  factory _$$_CalendarModelCopyWith(
          _$_CalendarModel value, $Res Function(_$_CalendarModel) then) =
      __$$_CalendarModelCopyWithImpl<$Res>;
  @override
  $Res call({HomeScreen currentScreen, ActionType selectedActionType});
}

/// @nodoc
class __$$_CalendarModelCopyWithImpl<$Res> extends _$HomeModelCopyWithImpl<$Res>
    implements _$$_CalendarModelCopyWith<$Res> {
  __$$_CalendarModelCopyWithImpl(
      _$_CalendarModel _value, $Res Function(_$_CalendarModel) _then)
      : super(_value, (v) => _then(v as _$_CalendarModel));

  @override
  _$_CalendarModel get _value => super._value as _$_CalendarModel;

  @override
  $Res call({
    Object? currentScreen = freezed,
    Object? selectedActionType = freezed,
  }) {
    return _then(_$_CalendarModel(
      currentScreen: currentScreen == freezed
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as HomeScreen,
      selectedActionType: selectedActionType == freezed
          ? _value.selectedActionType
          : selectedActionType // ignore: cast_nullable_to_non_nullable
              as ActionType,
    ));
  }
}

/// @nodoc

class _$_CalendarModel implements _CalendarModel {
  const _$_CalendarModel(
      {required this.currentScreen, required this.selectedActionType});

  @override
  final HomeScreen currentScreen;
  @override
  final ActionType selectedActionType;

  @override
  String toString() {
    return 'HomeModel(currentScreen: $currentScreen, selectedActionType: $selectedActionType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarModel &&
            const DeepCollectionEquality()
                .equals(other.currentScreen, currentScreen) &&
            const DeepCollectionEquality()
                .equals(other.selectedActionType, selectedActionType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentScreen),
      const DeepCollectionEquality().hash(selectedActionType));

  @JsonKey(ignore: true)
  @override
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      __$$_CalendarModelCopyWithImpl<_$_CalendarModel>(this, _$identity);
}

abstract class _CalendarModel implements HomeModel {
  const factory _CalendarModel(
      {required final HomeScreen currentScreen,
      required final ActionType selectedActionType}) = _$_CalendarModel;

  @override
  HomeScreen get currentScreen => throw _privateConstructorUsedError;
  @override
  ActionType get selectedActionType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
