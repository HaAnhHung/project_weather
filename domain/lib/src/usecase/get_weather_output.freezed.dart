// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_weather_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetWeatherOutput {
  WeatherEntity get weather => throw _privateConstructorUsedError;

  /// Create a copy of GetWeatherOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetWeatherOutputCopyWith<GetWeatherOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWeatherOutputCopyWith<$Res> {
  factory $GetWeatherOutputCopyWith(
    GetWeatherOutput value,
    $Res Function(GetWeatherOutput) then,
  ) = _$GetWeatherOutputCopyWithImpl<$Res, GetWeatherOutput>;
  @useResult
  $Res call({WeatherEntity weather});

  $WeatherEntityCopyWith<$Res> get weather;
}

/// @nodoc
class _$GetWeatherOutputCopyWithImpl<$Res, $Val extends GetWeatherOutput>
    implements $GetWeatherOutputCopyWith<$Res> {
  _$GetWeatherOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetWeatherOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? weather = null}) {
    return _then(
      _value.copyWith(
            weather:
                null == weather
                    ? _value.weather
                    : weather // ignore: cast_nullable_to_non_nullable
                        as WeatherEntity,
          )
          as $Val,
    );
  }

  /// Create a copy of GetWeatherOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherEntityCopyWith<$Res> get weather {
    return $WeatherEntityCopyWith<$Res>(_value.weather, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetWeatherOutputImplCopyWith<$Res>
    implements $GetWeatherOutputCopyWith<$Res> {
  factory _$$GetWeatherOutputImplCopyWith(
    _$GetWeatherOutputImpl value,
    $Res Function(_$GetWeatherOutputImpl) then,
  ) = __$$GetWeatherOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeatherEntity weather});

  @override
  $WeatherEntityCopyWith<$Res> get weather;
}

/// @nodoc
class __$$GetWeatherOutputImplCopyWithImpl<$Res>
    extends _$GetWeatherOutputCopyWithImpl<$Res, _$GetWeatherOutputImpl>
    implements _$$GetWeatherOutputImplCopyWith<$Res> {
  __$$GetWeatherOutputImplCopyWithImpl(
    _$GetWeatherOutputImpl _value,
    $Res Function(_$GetWeatherOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetWeatherOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? weather = null}) {
    return _then(
      _$GetWeatherOutputImpl(
        weather:
            null == weather
                ? _value.weather
                : weather // ignore: cast_nullable_to_non_nullable
                    as WeatherEntity,
      ),
    );
  }
}

/// @nodoc

class _$GetWeatherOutputImpl implements _GetWeatherOutput {
  const _$GetWeatherOutputImpl({required this.weather});

  @override
  final WeatherEntity weather;

  @override
  String toString() {
    return 'GetWeatherOutput(weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWeatherOutputImpl &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weather);

  /// Create a copy of GetWeatherOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWeatherOutputImplCopyWith<_$GetWeatherOutputImpl> get copyWith =>
      __$$GetWeatherOutputImplCopyWithImpl<_$GetWeatherOutputImpl>(
        this,
        _$identity,
      );
}

abstract class _GetWeatherOutput implements GetWeatherOutput {
  const factory _GetWeatherOutput({required final WeatherEntity weather}) =
      _$GetWeatherOutputImpl;

  @override
  WeatherEntity get weather;

  /// Create a copy of GetWeatherOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetWeatherOutputImplCopyWith<_$GetWeatherOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
