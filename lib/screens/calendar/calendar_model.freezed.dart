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
  DateTime get selectedDay => throw _privateConstructorUsedError;
  DateTime get focusedDay => throw _privateConstructorUsedError;
  Map<DateTime, List<ActionDateModel>> get selectedEvents =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarModelCopyWith<CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarModelCopyWith<$Res> {
  factory $CalendarModelCopyWith(
          CalendarModel value, $Res Function(CalendarModel) then) =
      _$CalendarModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime selectedDay,
      DateTime focusedDay,
      Map<DateTime, List<ActionDateModel>> selectedEvents});
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
    Object? selectedDay = freezed,
    Object? focusedDay = freezed,
    Object? selectedEvents = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedEvents: selectedEvents == freezed
          ? _value.selectedEvents
          : selectedEvents // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<ActionDateModel>>,
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
  $Res call(
      {DateTime selectedDay,
      DateTime focusedDay,
      Map<DateTime, List<ActionDateModel>> selectedEvents});
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
    Object? selectedDay = freezed,
    Object? focusedDay = freezed,
    Object? selectedEvents = freezed,
  }) {
    return _then(_$_CalendarModel(
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedEvents: selectedEvents == freezed
          ? _value._selectedEvents
          : selectedEvents // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<ActionDateModel>>,
    ));
  }
}

/// @nodoc

class _$_CalendarModel implements _CalendarModel {
  const _$_CalendarModel(
      {required this.selectedDay,
      required this.focusedDay,
      required final Map<DateTime, List<ActionDateModel>> selectedEvents})
      : _selectedEvents = selectedEvents;

  @override
  final DateTime selectedDay;
  @override
  final DateTime focusedDay;
  final Map<DateTime, List<ActionDateModel>> _selectedEvents;
  @override
  Map<DateTime, List<ActionDateModel>> get selectedEvents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedEvents);
  }

  @override
  String toString() {
    return 'CalendarModel(selectedDay: $selectedDay, focusedDay: $focusedDay, selectedEvents: $selectedEvents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarModel &&
            const DeepCollectionEquality()
                .equals(other.selectedDay, selectedDay) &&
            const DeepCollectionEquality()
                .equals(other.focusedDay, focusedDay) &&
            const DeepCollectionEquality()
                .equals(other._selectedEvents, _selectedEvents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDay),
      const DeepCollectionEquality().hash(focusedDay),
      const DeepCollectionEquality().hash(_selectedEvents));

  @JsonKey(ignore: true)
  @override
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      __$$_CalendarModelCopyWithImpl<_$_CalendarModel>(this, _$identity);
}

abstract class _CalendarModel implements CalendarModel {
  const factory _CalendarModel(
          {required final DateTime selectedDay,
          required final DateTime focusedDay,
          required final Map<DateTime, List<ActionDateModel>> selectedEvents}) =
      _$_CalendarModel;

  @override
  DateTime get selectedDay => throw _privateConstructorUsedError;
  @override
  DateTime get focusedDay => throw _privateConstructorUsedError;
  @override
  Map<DateTime, List<ActionDateModel>> get selectedEvents =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarModelCopyWith<_$_CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
