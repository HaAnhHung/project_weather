// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initiated,
    required TResult Function(bool isDarkMode) themeChanged,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool isCelsius) unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initiated,
    TResult? Function(bool isDarkMode)? themeChanged,
    TResult? Function(String locale)? localeChanged,
    TResult? Function(bool isCelsius)? unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initiated,
    TResult Function(bool isDarkMode)? themeChanged,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool isCelsius)? unitChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitiated value) initiated,
    required TResult Function(AppThemeChanged value) themeChanged,
    required TResult Function(AppLocaleChanged value) localeChanged,
    required TResult Function(AppUnitChanged value) unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitiated value)? initiated,
    TResult? Function(AppThemeChanged value)? themeChanged,
    TResult? Function(AppLocaleChanged value)? localeChanged,
    TResult? Function(AppUnitChanged value)? unitChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitiated value)? initiated,
    TResult Function(AppThemeChanged value)? themeChanged,
    TResult Function(AppLocaleChanged value)? localeChanged,
    TResult Function(AppUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AppInitiatedImplCopyWith<$Res> {
  factory _$$AppInitiatedImplCopyWith(
    _$AppInitiatedImpl value,
    $Res Function(_$AppInitiatedImpl) then,
  ) = __$$AppInitiatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInitiatedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppInitiatedImpl>
    implements _$$AppInitiatedImplCopyWith<$Res> {
  __$$AppInitiatedImplCopyWithImpl(
    _$AppInitiatedImpl _value,
    $Res Function(_$AppInitiatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppInitiatedImpl implements AppInitiated {
  const _$AppInitiatedImpl();

  @override
  String toString() {
    return 'AppEvent.initiated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInitiatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initiated,
    required TResult Function(bool isDarkMode) themeChanged,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool isCelsius) unitChanged,
  }) {
    return initiated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initiated,
    TResult? Function(bool isDarkMode)? themeChanged,
    TResult? Function(String locale)? localeChanged,
    TResult? Function(bool isCelsius)? unitChanged,
  }) {
    return initiated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initiated,
    TResult Function(bool isDarkMode)? themeChanged,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool isCelsius)? unitChanged,
    required TResult orElse(),
  }) {
    if (initiated != null) {
      return initiated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitiated value) initiated,
    required TResult Function(AppThemeChanged value) themeChanged,
    required TResult Function(AppLocaleChanged value) localeChanged,
    required TResult Function(AppUnitChanged value) unitChanged,
  }) {
    return initiated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitiated value)? initiated,
    TResult? Function(AppThemeChanged value)? themeChanged,
    TResult? Function(AppLocaleChanged value)? localeChanged,
    TResult? Function(AppUnitChanged value)? unitChanged,
  }) {
    return initiated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitiated value)? initiated,
    TResult Function(AppThemeChanged value)? themeChanged,
    TResult Function(AppLocaleChanged value)? localeChanged,
    TResult Function(AppUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) {
    if (initiated != null) {
      return initiated(this);
    }
    return orElse();
  }
}

abstract class AppInitiated implements AppEvent {
  const factory AppInitiated() = _$AppInitiatedImpl;
}

/// @nodoc
abstract class _$$AppThemeChangedImplCopyWith<$Res> {
  factory _$$AppThemeChangedImplCopyWith(
    _$AppThemeChangedImpl value,
    $Res Function(_$AppThemeChangedImpl) then,
  ) = __$$AppThemeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$AppThemeChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppThemeChangedImpl>
    implements _$$AppThemeChangedImplCopyWith<$Res> {
  __$$AppThemeChangedImplCopyWithImpl(
    _$AppThemeChangedImpl _value,
    $Res Function(_$AppThemeChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isDarkMode = null}) {
    return _then(
      _$AppThemeChangedImpl(
        null == isDarkMode
            ? _value.isDarkMode
            : isDarkMode // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$AppThemeChangedImpl implements AppThemeChanged {
  const _$AppThemeChangedImpl(this.isDarkMode);

  @override
  final bool isDarkMode;

  @override
  String toString() {
    return 'AppEvent.themeChanged(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppThemeChangedImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppThemeChangedImplCopyWith<_$AppThemeChangedImpl> get copyWith =>
      __$$AppThemeChangedImplCopyWithImpl<_$AppThemeChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initiated,
    required TResult Function(bool isDarkMode) themeChanged,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool isCelsius) unitChanged,
  }) {
    return themeChanged(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initiated,
    TResult? Function(bool isDarkMode)? themeChanged,
    TResult? Function(String locale)? localeChanged,
    TResult? Function(bool isCelsius)? unitChanged,
  }) {
    return themeChanged?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initiated,
    TResult Function(bool isDarkMode)? themeChanged,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool isCelsius)? unitChanged,
    required TResult orElse(),
  }) {
    if (themeChanged != null) {
      return themeChanged(isDarkMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitiated value) initiated,
    required TResult Function(AppThemeChanged value) themeChanged,
    required TResult Function(AppLocaleChanged value) localeChanged,
    required TResult Function(AppUnitChanged value) unitChanged,
  }) {
    return themeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitiated value)? initiated,
    TResult? Function(AppThemeChanged value)? themeChanged,
    TResult? Function(AppLocaleChanged value)? localeChanged,
    TResult? Function(AppUnitChanged value)? unitChanged,
  }) {
    return themeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitiated value)? initiated,
    TResult Function(AppThemeChanged value)? themeChanged,
    TResult Function(AppLocaleChanged value)? localeChanged,
    TResult Function(AppUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) {
    if (themeChanged != null) {
      return themeChanged(this);
    }
    return orElse();
  }
}

abstract class AppThemeChanged implements AppEvent {
  const factory AppThemeChanged(final bool isDarkMode) = _$AppThemeChangedImpl;

  bool get isDarkMode;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppThemeChangedImplCopyWith<_$AppThemeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppLocaleChangedImplCopyWith<$Res> {
  factory _$$AppLocaleChangedImplCopyWith(
    _$AppLocaleChangedImpl value,
    $Res Function(_$AppLocaleChangedImpl) then,
  ) = __$$AppLocaleChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locale});
}

/// @nodoc
class __$$AppLocaleChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppLocaleChangedImpl>
    implements _$$AppLocaleChangedImplCopyWith<$Res> {
  __$$AppLocaleChangedImplCopyWithImpl(
    _$AppLocaleChangedImpl _value,
    $Res Function(_$AppLocaleChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? locale = null}) {
    return _then(
      _$AppLocaleChangedImpl(
        null == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$AppLocaleChangedImpl implements AppLocaleChanged {
  const _$AppLocaleChangedImpl(this.locale);

  @override
  final String locale;

  @override
  String toString() {
    return 'AppEvent.localeChanged(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLocaleChangedImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLocaleChangedImplCopyWith<_$AppLocaleChangedImpl> get copyWith =>
      __$$AppLocaleChangedImplCopyWithImpl<_$AppLocaleChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initiated,
    required TResult Function(bool isDarkMode) themeChanged,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool isCelsius) unitChanged,
  }) {
    return localeChanged(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initiated,
    TResult? Function(bool isDarkMode)? themeChanged,
    TResult? Function(String locale)? localeChanged,
    TResult? Function(bool isCelsius)? unitChanged,
  }) {
    return localeChanged?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initiated,
    TResult Function(bool isDarkMode)? themeChanged,
    TResult Function(String locale)? localeChanged,
    TResult Function(bool isCelsius)? unitChanged,
    required TResult orElse(),
  }) {
    if (localeChanged != null) {
      return localeChanged(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitiated value) initiated,
    required TResult Function(AppThemeChanged value) themeChanged,
    required TResult Function(AppLocaleChanged value) localeChanged,
    required TResult Function(AppUnitChanged value) unitChanged,
  }) {
    return localeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitiated value)? initiated,
    TResult? Function(AppThemeChanged value)? themeChanged,
    TResult? Function(AppLocaleChanged value)? localeChanged,
    TResult? Function(AppUnitChanged value)? unitChanged,
  }) {
    return localeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitiated value)? initiated,
    TResult Function(AppThemeChanged value)? themeChanged,
    TResult Function(AppLocaleChanged value)? localeChanged,
    TResult Function(AppUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) {
    if (localeChanged != null) {
      return localeChanged(this);
    }
    return orElse();
  }
}

abstract class AppLocaleChanged implements AppEvent {
  const factory AppLocaleChanged(final String locale) = _$AppLocaleChangedImpl;

  String get locale;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLocaleChangedImplCopyWith<_$AppLocaleChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppUnitChangedImplCopyWith<$Res> {
  factory _$$AppUnitChangedImplCopyWith(
    _$AppUnitChangedImpl value,
    $Res Function(_$AppUnitChangedImpl) then,
  ) = __$$AppUnitChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isCelsius});
}

/// @nodoc
class __$$AppUnitChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppUnitChangedImpl>
    implements _$$AppUnitChangedImplCopyWith<$Res> {
  __$$AppUnitChangedImplCopyWithImpl(
    _$AppUnitChangedImpl _value,
    $Res Function(_$AppUnitChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isCelsius = null}) {
    return _then(
      _$AppUnitChangedImpl(
        null == isCelsius
            ? _value.isCelsius
            : isCelsius // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$AppUnitChangedImpl implements AppUnitChanged {
  const _$AppUnitChangedImpl(this.isCelsius);

  @override
  final bool isCelsius;

  @override
  String toString() {
    return 'AppEvent.unitChanged(isCelsius: $isCelsius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUnitChangedImpl &&
            (identical(other.isCelsius, isCelsius) ||
                other.isCelsius == isCelsius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCelsius);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUnitChangedImplCopyWith<_$AppUnitChangedImpl> get copyWith =>
      __$$AppUnitChangedImplCopyWithImpl<_$AppUnitChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initiated,
    required TResult Function(bool isDarkMode) themeChanged,
    required TResult Function(String locale) localeChanged,
    required TResult Function(bool isCelsius) unitChanged,
  }) {
    return unitChanged(isCelsius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initiated,
    TResult? Function(bool isDarkMode)? themeChanged,
    TResult? Function(String locale)? localeChanged,
    TResult? Function(bool isCelsius)? unitChanged,
  }) {
    return unitChanged?.call(isCelsius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initiated,
    TResult Function(bool isDarkMode)? themeChanged,
    TResult Function(String locale)? localeChanged,
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
    required TResult Function(AppInitiated value) initiated,
    required TResult Function(AppThemeChanged value) themeChanged,
    required TResult Function(AppLocaleChanged value) localeChanged,
    required TResult Function(AppUnitChanged value) unitChanged,
  }) {
    return unitChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitiated value)? initiated,
    TResult? Function(AppThemeChanged value)? themeChanged,
    TResult? Function(AppLocaleChanged value)? localeChanged,
    TResult? Function(AppUnitChanged value)? unitChanged,
  }) {
    return unitChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitiated value)? initiated,
    TResult Function(AppThemeChanged value)? themeChanged,
    TResult Function(AppLocaleChanged value)? localeChanged,
    TResult Function(AppUnitChanged value)? unitChanged,
    required TResult orElse(),
  }) {
    if (unitChanged != null) {
      return unitChanged(this);
    }
    return orElse();
  }
}

abstract class AppUnitChanged implements AppEvent {
  const factory AppUnitChanged(final bool isCelsius) = _$AppUnitChangedImpl;

  bool get isCelsius;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUnitChangedImplCopyWith<_$AppUnitChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
