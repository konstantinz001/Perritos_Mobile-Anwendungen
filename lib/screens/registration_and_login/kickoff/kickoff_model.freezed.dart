// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kickoff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KickoffModel {
  bool get switchTree => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KickoffModelCopyWith<KickoffModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KickoffModelCopyWith<$Res> {
  factory $KickoffModelCopyWith(
          KickoffModel value, $Res Function(KickoffModel) then) =
      _$KickoffModelCopyWithImpl<$Res>;
  $Res call({bool switchTree});
}

/// @nodoc
class _$KickoffModelCopyWithImpl<$Res> implements $KickoffModelCopyWith<$Res> {
  _$KickoffModelCopyWithImpl(this._value, this._then);

  final KickoffModel _value;
  // ignore: unused_field
  final $Res Function(KickoffModel) _then;

  @override
  $Res call({
    Object? switchTree = freezed,
  }) {
    return _then(_value.copyWith(
      switchTree: switchTree == freezed
          ? _value.switchTree
          : switchTree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_KickoffModelCopyWith<$Res>
    implements $KickoffModelCopyWith<$Res> {
  factory _$$_KickoffModelCopyWith(
          _$_KickoffModel value, $Res Function(_$_KickoffModel) then) =
      __$$_KickoffModelCopyWithImpl<$Res>;
  @override
  $Res call({bool switchTree});
}

/// @nodoc
class __$$_KickoffModelCopyWithImpl<$Res>
    extends _$KickoffModelCopyWithImpl<$Res>
    implements _$$_KickoffModelCopyWith<$Res> {
  __$$_KickoffModelCopyWithImpl(
      _$_KickoffModel _value, $Res Function(_$_KickoffModel) _then)
      : super(_value, (v) => _then(v as _$_KickoffModel));

  @override
  _$_KickoffModel get _value => super._value as _$_KickoffModel;

  @override
  $Res call({
    Object? switchTree = freezed,
  }) {
    return _then(_$_KickoffModel(
      switchTree: switchTree == freezed
          ? _value.switchTree
          : switchTree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_KickoffModel implements _KickoffModel {
  const _$_KickoffModel({required this.switchTree});

  @override
  final bool switchTree;

  @override
  String toString() {
    return 'KickoffModel(switchTree: $switchTree)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KickoffModel &&
            const DeepCollectionEquality()
                .equals(other.switchTree, switchTree));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(switchTree));

  @JsonKey(ignore: true)
  @override
  _$$_KickoffModelCopyWith<_$_KickoffModel> get copyWith =>
      __$$_KickoffModelCopyWithImpl<_$_KickoffModel>(this, _$identity);
}

abstract class _KickoffModel implements KickoffModel {
  const factory _KickoffModel({required final bool switchTree}) =
      _$_KickoffModel;

  @override
  bool get switchTree => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_KickoffModelCopyWith<_$_KickoffModel> get copyWith =>
      throw _privateConstructorUsedError;
}
