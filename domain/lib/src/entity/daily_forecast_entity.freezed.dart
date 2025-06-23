// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_forecast_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyForecastEntity _$DailyForecastEntityFromJson(Map<String, dynamic> json) {
  return _DailyForecastEntity.fromJson(json);
}

/// @nodoc
mixin _$DailyForecastEntity {
  DateTime get date => throw _privateConstructorUsedError;
  List<WeatherEntity> get hourlyForecasts => throw _privateConstructorUsedError;

  /// Serializes this DailyForecastEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyForecastEntityCopyWith<DailyForecastEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyForecastEntityCopyWith<$Res> {
  factory $DailyForecastEntityCopyWith(
    DailyForecastEntity value,
    $Res Function(DailyForecastEntity) then,
  ) = _$DailyForecastEntityCopyWithImpl<$Res, DailyForecastEntity>;
  @useResult
  $Res call({DateTime date, List<WeatherEntity> hourlyForecasts});
}

/// @nodoc
class _$DailyForecastEntityCopyWithImpl<$Res, $Val extends DailyForecastEntity>
    implements $DailyForecastEntityCopyWith<$Res> {
  _$DailyForecastEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? hourlyForecasts = null}) {
    return _then(
      _value.copyWith(
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            hourlyForecasts:
                null == hourlyForecasts
                    ? _value.hourlyForecasts
                    : hourlyForecasts // ignore: cast_nullable_to_non_nullable
                        as List<WeatherEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyForecastEntityImplCopyWith<$Res>
    implements $DailyForecastEntityCopyWith<$Res> {
  factory _$$DailyForecastEntityImplCopyWith(
    _$DailyForecastEntityImpl value,
    $Res Function(_$DailyForecastEntityImpl) then,
  ) = __$$DailyForecastEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<WeatherEntity> hourlyForecasts});
}

/// @nodoc
class __$$DailyForecastEntityImplCopyWithImpl<$Res>
    extends _$DailyForecastEntityCopyWithImpl<$Res, _$DailyForecastEntityImpl>
    implements _$$DailyForecastEntityImplCopyWith<$Res> {
  __$$DailyForecastEntityImplCopyWithImpl(
    _$DailyForecastEntityImpl _value,
    $Res Function(_$DailyForecastEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? hourlyForecasts = null}) {
    return _then(
      _$DailyForecastEntityImpl(
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        hourlyForecasts:
            null == hourlyForecasts
                ? _value._hourlyForecasts
                : hourlyForecasts // ignore: cast_nullable_to_non_nullable
                    as List<WeatherEntity>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyForecastEntityImpl implements _DailyForecastEntity {
  const _$DailyForecastEntityImpl({
    required this.date,
    required final List<WeatherEntity> hourlyForecasts,
  }) : _hourlyForecasts = hourlyForecasts;

  factory _$DailyForecastEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyForecastEntityImplFromJson(json);

  @override
  final DateTime date;
  final List<WeatherEntity> _hourlyForecasts;
  @override
  List<WeatherEntity> get hourlyForecasts {
    if (_hourlyForecasts is EqualUnmodifiableListView) return _hourlyForecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecasts);
  }

  @override
  String toString() {
    return 'DailyForecastEntity(date: $date, hourlyForecasts: $hourlyForecasts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyForecastEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(
              other._hourlyForecasts,
              _hourlyForecasts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    const DeepCollectionEquality().hash(_hourlyForecasts),
  );

  /// Create a copy of DailyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyForecastEntityImplCopyWith<_$DailyForecastEntityImpl> get copyWith =>
      __$$DailyForecastEntityImplCopyWithImpl<_$DailyForecastEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyForecastEntityImplToJson(this);
  }
}

abstract class _DailyForecastEntity implements DailyForecastEntity {
  const factory _DailyForecastEntity({
    required final DateTime date,
    required final List<WeatherEntity> hourlyForecasts,
  }) = _$DailyForecastEntityImpl;

  factory _DailyForecastEntity.fromJson(Map<String, dynamic> json) =
      _$DailyForecastEntityImpl.fromJson;

  @override
  DateTime get date;
  @override
  List<WeatherEntity> get hourlyForecasts;

  /// Create a copy of DailyForecastEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyForecastEntityImplCopyWith<_$DailyForecastEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
