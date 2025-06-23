// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(bool isCelsius) unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(bool isCelsius)? unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(bool isCelsius)? unitChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsInitialize value) initialize,
    required TResult Function(SettingsUnitChanged value) unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitialize value)? initialize,
    TResult? Function(SettingsUnitChanged value)? unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitialize value)? initialize,
    TResult Function(SettingsUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
    SettingsEvent value,
    $Res Function(SettingsEvent) then,
  ) = _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SettingsInitializeImplCopyWith<$Res> {
  factory _$$SettingsInitializeImplCopyWith(
    _$SettingsInitializeImpl value,
    $Res Function(_$SettingsInitializeImpl) then,
  ) = __$$SettingsInitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsInitializeImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$SettingsInitializeImpl>
    implements _$$SettingsInitializeImplCopyWith<$Res> {
  __$$SettingsInitializeImplCopyWithImpl(
    _$SettingsInitializeImpl _value,
    $Res Function(_$SettingsInitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SettingsInitializeImpl implements SettingsInitialize {
  const _$SettingsInitializeImpl();

  @override
  String toString() {
    return 'SettingsEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsInitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(bool isCelsius) unitChanged,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(bool isCelsius)? unitChanged,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(bool isCelsius)? unitChanged,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsInitialize value) initialize,
    required TResult Function(SettingsUnitChanged value) unitChanged,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitialize value)? initialize,
    TResult? Function(SettingsUnitChanged value)? unitChanged,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitialize value)? initialize,
    TResult Function(SettingsUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class SettingsInitialize implements SettingsEvent {
  const factory SettingsInitialize() = _$SettingsInitializeImpl;
}

/// @nodoc
abstract class _$$SettingsUnitChangedImplCopyWith<$Res> {
  factory _$$SettingsUnitChangedImplCopyWith(
    _$SettingsUnitChangedImpl value,
    $Res Function(_$SettingsUnitChangedImpl) then,
  ) = __$$SettingsUnitChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isCelsius});
}

/// @nodoc
class __$$SettingsUnitChangedImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$SettingsUnitChangedImpl>
    implements _$$SettingsUnitChangedImplCopyWith<$Res> {
  __$$SettingsUnitChangedImplCopyWithImpl(
    _$SettingsUnitChangedImpl _value,
    $Res Function(_$SettingsUnitChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isCelsius = null}) {
    return _then(
      _$SettingsUnitChangedImpl(
        null == isCelsius
            ? _value.isCelsius
            : isCelsius // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$SettingsUnitChangedImpl implements SettingsUnitChanged {
  const _$SettingsUnitChangedImpl(this.isCelsius);

  @override
  final bool isCelsius;

  @override
  String toString() {
    return 'SettingsEvent.unitChanged(isCelsius: $isCelsius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsUnitChangedImpl &&
            (identical(other.isCelsius, isCelsius) ||
                other.isCelsius == isCelsius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCelsius);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsUnitChangedImplCopyWith<_$SettingsUnitChangedImpl> get copyWith =>
      __$$SettingsUnitChangedImplCopyWithImpl<_$SettingsUnitChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(bool isCelsius) unitChanged,
  }) {
    return unitChanged(isCelsius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(bool isCelsius)? unitChanged,
  }) {
    return unitChanged?.call(isCelsius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(bool isCelsius)? unitChanged,
    required TResult orElse(),
  }) {
    if (unitChanged != null) {
      return unitChanged(isCelsius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsInitialize value) initialize,
    required TResult Function(SettingsUnitChanged value) unitChanged,
  }) {
    return unitChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitialize value)? initialize,
    TResult? Function(SettingsUnitChanged value)? unitChanged,
  }) {
    return unitChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitialize value)? initialize,
    TResult Function(SettingsUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) {
    if (unitChanged != null) {
      return unitChanged(this);
    }
    return orElse();
  }
}

abstract class SettingsUnitChanged implements SettingsEvent {
  const factory SettingsUnitChanged(final bool isCelsius) =
      _$SettingsUnitChangedImpl;

  bool get isCelsius;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsUnitChangedImplCopyWith<_$SettingsUnitChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
