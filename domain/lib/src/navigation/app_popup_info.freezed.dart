// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_popup_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppPopupInfo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Func0<dynamic>? onPressed)
    confirmDialog,
    required TResult Function(String message, Func0<dynamic>? onRetryPressed)
    errorWithRetryDialog,
    required TResult Function() locationPermissionDialog,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult? Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult? Function()? locationPermissionDialog,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult Function()? locationPermissionDialog,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_LocationPermissionDialog value)
    locationPermissionDialog,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_LocationPermissionDialog value)?
    locationPermissionDialog,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_LocationPermissionDialog value)? locationPermissionDialog,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPopupInfoCopyWith<$Res> {
  factory $AppPopupInfoCopyWith(
    AppPopupInfo value,
    $Res Function(AppPopupInfo) then,
  ) = _$AppPopupInfoCopyWithImpl<$Res, AppPopupInfo>;
}

/// @nodoc
class _$AppPopupInfoCopyWithImpl<$Res, $Val extends AppPopupInfo>
    implements $AppPopupInfoCopyWith<$Res> {
  _$AppPopupInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConfirmDialogImplCopyWith<$Res> {
  factory _$$ConfirmDialogImplCopyWith(
    _$ConfirmDialogImpl value,
    $Res Function(_$ConfirmDialogImpl) then,
  ) = __$$ConfirmDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Func0<dynamic>? onPressed});
}

/// @nodoc
class __$$ConfirmDialogImplCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$ConfirmDialogImpl>
    implements _$$ConfirmDialogImplCopyWith<$Res> {
  __$$ConfirmDialogImplCopyWithImpl(
    _$ConfirmDialogImpl _value,
    $Res Function(_$ConfirmDialogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? onPressed = freezed}) {
    return _then(
      _$ConfirmDialogImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        onPressed:
            freezed == onPressed
                ? _value.onPressed
                : onPressed // ignore: cast_nullable_to_non_nullable
                    as Func0<dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$ConfirmDialogImpl implements _ConfirmDialog {
  const _$ConfirmDialogImpl({required this.message, this.onPressed});

  @override
  final String message;
  @override
  final Func0<dynamic>? onPressed;

  @override
  String toString() {
    return 'AppPopupInfo.confirmDialog(message: $message, onPressed: $onPressed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmDialogImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, onPressed);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmDialogImplCopyWith<_$ConfirmDialogImpl> get copyWith =>
      __$$ConfirmDialogImplCopyWithImpl<_$ConfirmDialogImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Func0<dynamic>? onPressed)
    confirmDialog,
    required TResult Function(String message, Func0<dynamic>? onRetryPressed)
    errorWithRetryDialog,
    required TResult Function() locationPermissionDialog,
  }) {
    return confirmDialog(message, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult? Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult? Function()? locationPermissionDialog,
  }) {
    return confirmDialog?.call(message, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult Function()? locationPermissionDialog,
    required TResult orElse(),
  }) {
    if (confirmDialog != null) {
      return confirmDialog(message, onPressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_LocationPermissionDialog value)
    locationPermissionDialog,
  }) {
    return confirmDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_LocationPermissionDialog value)?
    locationPermissionDialog,
  }) {
    return confirmDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_LocationPermissionDialog value)? locationPermissionDialog,
    required TResult orElse(),
  }) {
    if (confirmDialog != null) {
      return confirmDialog(this);
    }
    return orElse();
  }
}

abstract class _ConfirmDialog implements AppPopupInfo {
  const factory _ConfirmDialog({
    required final String message,
    final Func0<dynamic>? onPressed,
  }) = _$ConfirmDialogImpl;

  String get message;
  Func0<dynamic>? get onPressed;

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmDialogImplCopyWith<_$ConfirmDialogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorWithRetryDialogImplCopyWith<$Res> {
  factory _$$ErrorWithRetryDialogImplCopyWith(
    _$ErrorWithRetryDialogImpl value,
    $Res Function(_$ErrorWithRetryDialogImpl) then,
  ) = __$$ErrorWithRetryDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Func0<dynamic>? onRetryPressed});
}

/// @nodoc
class __$$ErrorWithRetryDialogImplCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$ErrorWithRetryDialogImpl>
    implements _$$ErrorWithRetryDialogImplCopyWith<$Res> {
  __$$ErrorWithRetryDialogImplCopyWithImpl(
    _$ErrorWithRetryDialogImpl _value,
    $Res Function(_$ErrorWithRetryDialogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? onRetryPressed = freezed}) {
    return _then(
      _$ErrorWithRetryDialogImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        onRetryPressed:
            freezed == onRetryPressed
                ? _value.onRetryPressed
                : onRetryPressed // ignore: cast_nullable_to_non_nullable
                    as Func0<dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$ErrorWithRetryDialogImpl implements _ErrorWithRetryDialog {
  const _$ErrorWithRetryDialogImpl({
    required this.message,
    this.onRetryPressed,
  });

  @override
  final String message;
  @override
  final Func0<dynamic>? onRetryPressed;

  @override
  String toString() {
    return 'AppPopupInfo.errorWithRetryDialog(message: $message, onRetryPressed: $onRetryPressed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorWithRetryDialogImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.onRetryPressed, onRetryPressed) ||
                other.onRetryPressed == onRetryPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, onRetryPressed);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorWithRetryDialogImplCopyWith<_$ErrorWithRetryDialogImpl>
  get copyWith =>
      __$$ErrorWithRetryDialogImplCopyWithImpl<_$ErrorWithRetryDialogImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Func0<dynamic>? onPressed)
    confirmDialog,
    required TResult Function(String message, Func0<dynamic>? onRetryPressed)
    errorWithRetryDialog,
    required TResult Function() locationPermissionDialog,
  }) {
    return errorWithRetryDialog(message, onRetryPressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult? Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult? Function()? locationPermissionDialog,
  }) {
    return errorWithRetryDialog?.call(message, onRetryPressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult Function()? locationPermissionDialog,
    required TResult orElse(),
  }) {
    if (errorWithRetryDialog != null) {
      return errorWithRetryDialog(message, onRetryPressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_LocationPermissionDialog value)
    locationPermissionDialog,
  }) {
    return errorWithRetryDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_LocationPermissionDialog value)?
    locationPermissionDialog,
  }) {
    return errorWithRetryDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_LocationPermissionDialog value)? locationPermissionDialog,
    required TResult orElse(),
  }) {
    if (errorWithRetryDialog != null) {
      return errorWithRetryDialog(this);
    }
    return orElse();
  }
}

abstract class _ErrorWithRetryDialog implements AppPopupInfo {
  const factory _ErrorWithRetryDialog({
    required final String message,
    final Func0<dynamic>? onRetryPressed,
  }) = _$ErrorWithRetryDialogImpl;

  String get message;
  Func0<dynamic>? get onRetryPressed;

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorWithRetryDialogImplCopyWith<_$ErrorWithRetryDialogImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationPermissionDialogImplCopyWith<$Res> {
  factory _$$LocationPermissionDialogImplCopyWith(
    _$LocationPermissionDialogImpl value,
    $Res Function(_$LocationPermissionDialogImpl) then,
  ) = __$$LocationPermissionDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationPermissionDialogImplCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$LocationPermissionDialogImpl>
    implements _$$LocationPermissionDialogImplCopyWith<$Res> {
  __$$LocationPermissionDialogImplCopyWithImpl(
    _$LocationPermissionDialogImpl _value,
    $Res Function(_$LocationPermissionDialogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LocationPermissionDialogImpl implements _LocationPermissionDialog {
  const _$LocationPermissionDialogImpl();

  @override
  String toString() {
    return 'AppPopupInfo.locationPermissionDialog()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionDialogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Func0<dynamic>? onPressed)
    confirmDialog,
    required TResult Function(String message, Func0<dynamic>? onRetryPressed)
    errorWithRetryDialog,
    required TResult Function() locationPermissionDialog,
  }) {
    return locationPermissionDialog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult? Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult? Function()? locationPermissionDialog,
  }) {
    return locationPermissionDialog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Func0<dynamic>? onPressed)? confirmDialog,
    TResult Function(String message, Func0<dynamic>? onRetryPressed)?
    errorWithRetryDialog,
    TResult Function()? locationPermissionDialog,
    required TResult orElse(),
  }) {
    if (locationPermissionDialog != null) {
      return locationPermissionDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_LocationPermissionDialog value)
    locationPermissionDialog,
  }) {
    return locationPermissionDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_LocationPermissionDialog value)?
    locationPermissionDialog,
  }) {
    return locationPermissionDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_LocationPermissionDialog value)? locationPermissionDialog,
    required TResult orElse(),
  }) {
    if (locationPermissionDialog != null) {
      return locationPermissionDialog(this);
    }
    return orElse();
  }
}

abstract class _LocationPermissionDialog implements AppPopupInfo {
  const factory _LocationPermissionDialog() = _$LocationPermissionDialogImpl;
}
