// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_weather_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetWeatherInput {
  String? get city => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  /// Create a copy of GetWeatherInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetWeatherInputCopyWith<GetWeatherInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWeatherInputCopyWith<$Res> {
  factory $GetWeatherInputCopyWith(
    GetWeatherInput value,
    $Res Function(GetWeatherInput) then,
  ) = _$GetWeatherInputCopyWithImpl<$Res, GetWeatherInput>;
  @useResult
  $Res call({String? city, double? lat, double? lon});
}

/// @nodoc
class _$GetWeatherInputCopyWithImpl<$Res, $Val extends GetWeatherInput>
    implements $GetWeatherInputCopyWith<$Res> {
  _$GetWeatherInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetWeatherInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(
      _value.copyWith(
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
            lat:
                freezed == lat
                    ? _value.lat
                    : lat // ignore: cast_nullable_to_non_nullable
                        as double?,
            lon:
                freezed == lon
                    ? _value.lon
                    : lon // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetWeatherInputImplCopyWith<$Res>
    implements $GetWeatherInputCopyWith<$Res> {
  factory _$$GetWeatherInputImplCopyWith(
    _$GetWeatherInputImpl value,
    $Res Function(_$GetWeatherInputImpl) then,
  ) = __$$GetWeatherInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? city, double? lat, double? lon});
}

/// @nodoc
class __$$GetWeatherInputImplCopyWithImpl<$Res>
    extends _$GetWeatherInputCopyWithImpl<$Res, _$GetWeatherInputImpl>
    implements _$$GetWeatherInputImplCopyWith<$Res> {
  __$$GetWeatherInputImplCopyWithImpl(
    _$GetWeatherInputImpl _value,
    $Res Function(_$GetWeatherInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetWeatherInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(
      _$GetWeatherInputImpl(
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        lat:
            freezed == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double?,
        lon:
            freezed == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc

class _$GetWeatherInputImpl implements _GetWeatherInput {
  const _$GetWeatherInputImpl({this.city, this.lat, this.lon});

  @override
  final String? city;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'GetWeatherInput(city: $city, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWeatherInputImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city, lat, lon);

  /// Create a copy of GetWeatherInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWeatherInputImplCopyWith<_$GetWeatherInputImpl> get copyWith =>
      __$$GetWeatherInputImplCopyWithImpl<_$GetWeatherInputImpl>(
        this,
        _$identity,
      );
}

abstract class _GetWeatherInput implements GetWeatherInput {
  const factory _GetWeatherInput({
    final String? city,
    final double? lat,
    final double? lon,
  }) = _$GetWeatherInputImpl;

  @override
  String? get city;
  @override
  double? get lat;
  @override
  double? get lon;

  /// Create a copy of GetWeatherInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetWeatherInputImplCopyWith<_$GetWeatherInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
