// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WeatherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
    WeatherEvent value,
    $Res Function(WeatherEvent) then,
  ) = _$WeatherEventCopyWithImpl<$Res, WeatherEvent>;
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res, $Val extends WeatherEvent>
    implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WeatherStartedImplCopyWith<$Res> {
  factory _$$WeatherStartedImplCopyWith(
    _$WeatherStartedImpl value,
    $Res Function(_$WeatherStartedImpl) then,
  ) = __$$WeatherStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeatherStartedImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherStartedImpl>
    implements _$$WeatherStartedImplCopyWith<$Res> {
  __$$WeatherStartedImplCopyWithImpl(
    _$WeatherStartedImpl _value,
    $Res Function(_$WeatherStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeatherStartedImpl implements WeatherStarted {
  const _$WeatherStartedImpl();

  @override
  String toString() {
    return 'WeatherEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeatherStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class WeatherStarted implements WeatherEvent {
  const factory WeatherStarted() = _$WeatherStartedImpl;
}

/// @nodoc
abstract class _$$WeatherFetchCurrentImplCopyWith<$Res> {
  factory _$$WeatherFetchCurrentImplCopyWith(
    _$WeatherFetchCurrentImpl value,
    $Res Function(_$WeatherFetchCurrentImpl) then,
  ) = __$$WeatherFetchCurrentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$WeatherFetchCurrentImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherFetchCurrentImpl>
    implements _$$WeatherFetchCurrentImplCopyWith<$Res> {
  __$$WeatherFetchCurrentImplCopyWithImpl(
    _$WeatherFetchCurrentImpl _value,
    $Res Function(_$WeatherFetchCurrentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lon = null}) {
    return _then(
      _$WeatherFetchCurrentImpl(
        lat:
            null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
        lon:
            null == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$WeatherFetchCurrentImpl implements WeatherFetchCurrent {
  const _$WeatherFetchCurrentImpl({required this.lat, required this.lon});

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'WeatherEvent.fetchCurrent(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherFetchCurrentImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherFetchCurrentImplCopyWith<_$WeatherFetchCurrentImpl> get copyWith =>
      __$$WeatherFetchCurrentImplCopyWithImpl<_$WeatherFetchCurrentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) {
    return fetchCurrent(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) {
    return fetchCurrent?.call(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchCurrent != null) {
      return fetchCurrent(lat, lon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) {
    return fetchCurrent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) {
    return fetchCurrent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchCurrent != null) {
      return fetchCurrent(this);
    }
    return orElse();
  }
}

abstract class WeatherFetchCurrent implements WeatherEvent {
  const factory WeatherFetchCurrent({
    required final double lat,
    required final double lon,
  }) = _$WeatherFetchCurrentImpl;

  double get lat;
  double get lon;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherFetchCurrentImplCopyWith<_$WeatherFetchCurrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeatherFetchByCityImplCopyWith<$Res> {
  factory _$$WeatherFetchByCityImplCopyWith(
    _$WeatherFetchByCityImpl value,
    $Res Function(_$WeatherFetchByCityImpl) then,
  ) = __$$WeatherFetchByCityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String city});
}

/// @nodoc
class __$$WeatherFetchByCityImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherFetchByCityImpl>
    implements _$$WeatherFetchByCityImplCopyWith<$Res> {
  __$$WeatherFetchByCityImplCopyWithImpl(
    _$WeatherFetchByCityImpl _value,
    $Res Function(_$WeatherFetchByCityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? city = null}) {
    return _then(
      _$WeatherFetchByCityImpl(
        city:
            null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$WeatherFetchByCityImpl implements WeatherFetchByCity {
  const _$WeatherFetchByCityImpl({required this.city});

  @override
  final String city;

  @override
  String toString() {
    return 'WeatherEvent.fetchByCity(city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherFetchByCityImpl &&
            (identical(other.city, city) || other.city == city));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherFetchByCityImplCopyWith<_$WeatherFetchByCityImpl> get copyWith =>
      __$$WeatherFetchByCityImplCopyWithImpl<_$WeatherFetchByCityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) {
    return fetchByCity(city);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) {
    return fetchByCity?.call(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchByCity != null) {
      return fetchByCity(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) {
    return fetchByCity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) {
    return fetchByCity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchByCity != null) {
      return fetchByCity(this);
    }
    return orElse();
  }
}

abstract class WeatherFetchByCity implements WeatherEvent {
  const factory WeatherFetchByCity({required final String city}) =
      _$WeatherFetchByCityImpl;

  String get city;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherFetchByCityImplCopyWith<_$WeatherFetchByCityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeatherUnitChangedImplCopyWith<$Res> {
  factory _$$WeatherUnitChangedImplCopyWith(
    _$WeatherUnitChangedImpl value,
    $Res Function(_$WeatherUnitChangedImpl) then,
  ) = __$$WeatherUnitChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isCelsius});
}

/// @nodoc
class __$$WeatherUnitChangedImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherUnitChangedImpl>
    implements _$$WeatherUnitChangedImplCopyWith<$Res> {
  __$$WeatherUnitChangedImplCopyWithImpl(
    _$WeatherUnitChangedImpl _value,
    $Res Function(_$WeatherUnitChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isCelsius = null}) {
    return _then(
      _$WeatherUnitChangedImpl(
        isCelsius:
            null == isCelsius
                ? _value.isCelsius
                : isCelsius // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$WeatherUnitChangedImpl implements WeatherUnitChanged {
  const _$WeatherUnitChangedImpl({required this.isCelsius});

  @override
  final bool isCelsius;

  @override
  String toString() {
    return 'WeatherEvent.unitChanged(isCelsius: $isCelsius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherUnitChangedImpl &&
            (identical(other.isCelsius, isCelsius) ||
                other.isCelsius == isCelsius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCelsius);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherUnitChangedImplCopyWith<_$WeatherUnitChangedImpl> get copyWith =>
      __$$WeatherUnitChangedImplCopyWithImpl<_$WeatherUnitChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) {
    return unitChanged(isCelsius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) {
    return unitChanged?.call(isCelsius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
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
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) {
    return unitChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) {
    return unitChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (unitChanged != null) {
      return unitChanged(this);
    }
    return orElse();
  }
}

abstract class WeatherUnitChanged implements WeatherEvent {
  const factory WeatherUnitChanged({required final bool isCelsius}) =
      _$WeatherUnitChangedImpl;

  bool get isCelsius;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherUnitChangedImplCopyWith<_$WeatherUnitChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeatherRefreshImplCopyWith<$Res> {
  factory _$$WeatherRefreshImplCopyWith(
    _$WeatherRefreshImpl value,
    $Res Function(_$WeatherRefreshImpl) then,
  ) = __$$WeatherRefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeatherRefreshImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherRefreshImpl>
    implements _$$WeatherRefreshImplCopyWith<$Res> {
  __$$WeatherRefreshImplCopyWithImpl(
    _$WeatherRefreshImpl _value,
    $Res Function(_$WeatherRefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeatherRefreshImpl implements WeatherRefresh {
  const _$WeatherRefreshImpl();

  @override
  String toString() {
    return 'WeatherEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeatherRefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class WeatherRefresh implements WeatherEvent {
  const factory WeatherRefresh() = _$WeatherRefreshImpl;
}

/// @nodoc
abstract class _$$WeatherFetchForecastImplCopyWith<$Res> {
  factory _$$WeatherFetchForecastImplCopyWith(
    _$WeatherFetchForecastImpl value,
    $Res Function(_$WeatherFetchForecastImpl) then,
  ) = __$$WeatherFetchForecastImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String city});
}

/// @nodoc
class __$$WeatherFetchForecastImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherFetchForecastImpl>
    implements _$$WeatherFetchForecastImplCopyWith<$Res> {
  __$$WeatherFetchForecastImplCopyWithImpl(
    _$WeatherFetchForecastImpl _value,
    $Res Function(_$WeatherFetchForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? city = null}) {
    return _then(
      _$WeatherFetchForecastImpl(
        city:
            null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$WeatherFetchForecastImpl implements WeatherFetchForecast {
  const _$WeatherFetchForecastImpl({required this.city});

  @override
  final String city;

  @override
  String toString() {
    return 'WeatherEvent.fetchForecast(city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherFetchForecastImpl &&
            (identical(other.city, city) || other.city == city));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherFetchForecastImplCopyWith<_$WeatherFetchForecastImpl>
  get copyWith =>
      __$$WeatherFetchForecastImplCopyWithImpl<_$WeatherFetchForecastImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) {
    return fetchForecast(city);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) {
    return fetchForecast?.call(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchForecast != null) {
      return fetchForecast(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) {
    return fetchForecast(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) {
    return fetchForecast?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchForecast != null) {
      return fetchForecast(this);
    }
    return orElse();
  }
}

abstract class WeatherFetchForecast implements WeatherEvent {
  const factory WeatherFetchForecast({required final String city}) =
      _$WeatherFetchForecastImpl;

  String get city;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherFetchForecastImplCopyWith<_$WeatherFetchForecastImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeatherFetchForecastByLatLonImplCopyWith<$Res> {
  factory _$$WeatherFetchForecastByLatLonImplCopyWith(
    _$WeatherFetchForecastByLatLonImpl value,
    $Res Function(_$WeatherFetchForecastByLatLonImpl) then,
  ) = __$$WeatherFetchForecastByLatLonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$WeatherFetchForecastByLatLonImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherFetchForecastByLatLonImpl>
    implements _$$WeatherFetchForecastByLatLonImplCopyWith<$Res> {
  __$$WeatherFetchForecastByLatLonImplCopyWithImpl(
    _$WeatherFetchForecastByLatLonImpl _value,
    $Res Function(_$WeatherFetchForecastByLatLonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lon = null}) {
    return _then(
      _$WeatherFetchForecastByLatLonImpl(
        lat:
            null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
        lon:
            null == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$WeatherFetchForecastByLatLonImpl
    implements WeatherFetchForecastByLatLon {
  const _$WeatherFetchForecastByLatLonImpl({
    required this.lat,
    required this.lon,
  });

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'WeatherEvent.fetchForecastByLatLon(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherFetchForecastByLatLonImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherFetchForecastByLatLonImplCopyWith<
    _$WeatherFetchForecastByLatLonImpl
  >
  get copyWith => __$$WeatherFetchForecastByLatLonImplCopyWithImpl<
    _$WeatherFetchForecastByLatLonImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double lon) fetchCurrent,
    required TResult Function(String city) fetchByCity,
    required TResult Function(bool isCelsius) unitChanged,
    required TResult Function() refresh,
    required TResult Function(String city) fetchForecast,
    required TResult Function(double lat, double lon) fetchForecastByLatLon,
  }) {
    return fetchForecastByLatLon(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double lon)? fetchCurrent,
    TResult? Function(String city)? fetchByCity,
    TResult? Function(bool isCelsius)? unitChanged,
    TResult? Function()? refresh,
    TResult? Function(String city)? fetchForecast,
    TResult? Function(double lat, double lon)? fetchForecastByLatLon,
  }) {
    return fetchForecastByLatLon?.call(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double lon)? fetchCurrent,
    TResult Function(String city)? fetchByCity,
    TResult Function(bool isCelsius)? unitChanged,
    TResult Function()? refresh,
    TResult Function(String city)? fetchForecast,
    TResult Function(double lat, double lon)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchForecastByLatLon != null) {
      return fetchForecastByLatLon(lat, lon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherStarted value) started,
    required TResult Function(WeatherFetchCurrent value) fetchCurrent,
    required TResult Function(WeatherFetchByCity value) fetchByCity,
    required TResult Function(WeatherUnitChanged value) unitChanged,
    required TResult Function(WeatherRefresh value) refresh,
    required TResult Function(WeatherFetchForecast value) fetchForecast,
    required TResult Function(WeatherFetchForecastByLatLon value)
    fetchForecastByLatLon,
  }) {
    return fetchForecastByLatLon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherStarted value)? started,
    TResult? Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult? Function(WeatherFetchByCity value)? fetchByCity,
    TResult? Function(WeatherUnitChanged value)? unitChanged,
    TResult? Function(WeatherRefresh value)? refresh,
    TResult? Function(WeatherFetchForecast value)? fetchForecast,
    TResult? Function(WeatherFetchForecastByLatLon value)?
    fetchForecastByLatLon,
  }) {
    return fetchForecastByLatLon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherStarted value)? started,
    TResult Function(WeatherFetchCurrent value)? fetchCurrent,
    TResult Function(WeatherFetchByCity value)? fetchByCity,
    TResult Function(WeatherUnitChanged value)? unitChanged,
    TResult Function(WeatherRefresh value)? refresh,
    TResult Function(WeatherFetchForecast value)? fetchForecast,
    TResult Function(WeatherFetchForecastByLatLon value)? fetchForecastByLatLon,
    required TResult orElse(),
  }) {
    if (fetchForecastByLatLon != null) {
      return fetchForecastByLatLon(this);
    }
    return orElse();
  }
}

abstract class WeatherFetchForecastByLatLon implements WeatherEvent {
  const factory WeatherFetchForecastByLatLon({
    required final double lat,
    required final double lon,
  }) = _$WeatherFetchForecastByLatLonImpl;

  double get lat;
  double get lon;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherFetchForecastByLatLonImplCopyWith<
    _$WeatherFetchForecastByLatLonImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
