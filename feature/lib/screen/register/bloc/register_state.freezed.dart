// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(String message) error,
    required TResult Function() validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(String message)? error,
    TResult? Function()? validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(String message)? error,
    TResult Function()? validated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInit value) init,
    required TResult Function(RegisterLoading value) loading,
    required TResult Function(RegisterIdle value) idle,
    required TResult Function(RegisterError value) error,
    required TResult Function(RegisterInputValidated value) validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInit value)? init,
    TResult? Function(RegisterLoading value)? loading,
    TResult? Function(RegisterIdle value)? idle,
    TResult? Function(RegisterError value)? error,
    TResult? Function(RegisterInputValidated value)? validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInit value)? init,
    TResult Function(RegisterLoading value)? loading,
    TResult Function(RegisterIdle value)? idle,
    TResult Function(RegisterError value)? error,
    TResult Function(RegisterInputValidated value)? validated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterInitCopyWith<$Res> {
  factory _$$RegisterInitCopyWith(
          _$RegisterInit value, $Res Function(_$RegisterInit) then) =
      __$$RegisterInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterInitCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterInit>
    implements _$$RegisterInitCopyWith<$Res> {
  __$$RegisterInitCopyWithImpl(
      _$RegisterInit _value, $Res Function(_$RegisterInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterInit implements RegisterInit {
  const _$RegisterInit();

  @override
  String toString() {
    return 'RegisterState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(String message) error,
    required TResult Function() validated,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(String message)? error,
    TResult? Function()? validated,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(String message)? error,
    TResult Function()? validated,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInit value) init,
    required TResult Function(RegisterLoading value) loading,
    required TResult Function(RegisterIdle value) idle,
    required TResult Function(RegisterError value) error,
    required TResult Function(RegisterInputValidated value) validated,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInit value)? init,
    TResult? Function(RegisterLoading value)? loading,
    TResult? Function(RegisterIdle value)? idle,
    TResult? Function(RegisterError value)? error,
    TResult? Function(RegisterInputValidated value)? validated,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInit value)? init,
    TResult Function(RegisterLoading value)? loading,
    TResult Function(RegisterIdle value)? idle,
    TResult Function(RegisterError value)? error,
    TResult Function(RegisterInputValidated value)? validated,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class RegisterInit implements RegisterState {
  const factory RegisterInit() = _$RegisterInit;
}

/// @nodoc
abstract class _$$RegisterLoadingCopyWith<$Res> {
  factory _$$RegisterLoadingCopyWith(
          _$RegisterLoading value, $Res Function(_$RegisterLoading) then) =
      __$$RegisterLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterLoadingCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterLoading>
    implements _$$RegisterLoadingCopyWith<$Res> {
  __$$RegisterLoadingCopyWithImpl(
      _$RegisterLoading _value, $Res Function(_$RegisterLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterLoading implements RegisterLoading {
  const _$RegisterLoading();

  @override
  String toString() {
    return 'RegisterState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(String message) error,
    required TResult Function() validated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(String message)? error,
    TResult? Function()? validated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(String message)? error,
    TResult Function()? validated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInit value) init,
    required TResult Function(RegisterLoading value) loading,
    required TResult Function(RegisterIdle value) idle,
    required TResult Function(RegisterError value) error,
    required TResult Function(RegisterInputValidated value) validated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInit value)? init,
    TResult? Function(RegisterLoading value)? loading,
    TResult? Function(RegisterIdle value)? idle,
    TResult? Function(RegisterError value)? error,
    TResult? Function(RegisterInputValidated value)? validated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInit value)? init,
    TResult Function(RegisterLoading value)? loading,
    TResult Function(RegisterIdle value)? idle,
    TResult Function(RegisterError value)? error,
    TResult Function(RegisterInputValidated value)? validated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegisterLoading implements RegisterState {
  const factory RegisterLoading() = _$RegisterLoading;
}

/// @nodoc
abstract class _$$RegisterIdleCopyWith<$Res> {
  factory _$$RegisterIdleCopyWith(
          _$RegisterIdle value, $Res Function(_$RegisterIdle) then) =
      __$$RegisterIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterIdleCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterIdle>
    implements _$$RegisterIdleCopyWith<$Res> {
  __$$RegisterIdleCopyWithImpl(
      _$RegisterIdle _value, $Res Function(_$RegisterIdle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterIdle implements RegisterIdle {
  const _$RegisterIdle();

  @override
  String toString() {
    return 'RegisterState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(String message) error,
    required TResult Function() validated,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(String message)? error,
    TResult? Function()? validated,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(String message)? error,
    TResult Function()? validated,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInit value) init,
    required TResult Function(RegisterLoading value) loading,
    required TResult Function(RegisterIdle value) idle,
    required TResult Function(RegisterError value) error,
    required TResult Function(RegisterInputValidated value) validated,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInit value)? init,
    TResult? Function(RegisterLoading value)? loading,
    TResult? Function(RegisterIdle value)? idle,
    TResult? Function(RegisterError value)? error,
    TResult? Function(RegisterInputValidated value)? validated,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInit value)? init,
    TResult Function(RegisterLoading value)? loading,
    TResult Function(RegisterIdle value)? idle,
    TResult Function(RegisterError value)? error,
    TResult Function(RegisterInputValidated value)? validated,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class RegisterIdle implements RegisterState {
  const factory RegisterIdle() = _$RegisterIdle;
}

/// @nodoc
abstract class _$$RegisterErrorCopyWith<$Res> {
  factory _$$RegisterErrorCopyWith(
          _$RegisterError value, $Res Function(_$RegisterError) then) =
      __$$RegisterErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterError>
    implements _$$RegisterErrorCopyWith<$Res> {
  __$$RegisterErrorCopyWithImpl(
      _$RegisterError _value, $Res Function(_$RegisterError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegisterError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterError implements RegisterError {
  const _$RegisterError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorCopyWith<_$RegisterError> get copyWith =>
      __$$RegisterErrorCopyWithImpl<_$RegisterError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(String message) error,
    required TResult Function() validated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(String message)? error,
    TResult? Function()? validated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(String message)? error,
    TResult Function()? validated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInit value) init,
    required TResult Function(RegisterLoading value) loading,
    required TResult Function(RegisterIdle value) idle,
    required TResult Function(RegisterError value) error,
    required TResult Function(RegisterInputValidated value) validated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInit value)? init,
    TResult? Function(RegisterLoading value)? loading,
    TResult? Function(RegisterIdle value)? idle,
    TResult? Function(RegisterError value)? error,
    TResult? Function(RegisterInputValidated value)? validated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInit value)? init,
    TResult Function(RegisterLoading value)? loading,
    TResult Function(RegisterIdle value)? idle,
    TResult Function(RegisterError value)? error,
    TResult Function(RegisterInputValidated value)? validated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RegisterError implements RegisterState {
  const factory RegisterError(final String message) = _$RegisterError;

  String get message;
  @JsonKey(ignore: true)
  _$$RegisterErrorCopyWith<_$RegisterError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterInputValidatedCopyWith<$Res> {
  factory _$$RegisterInputValidatedCopyWith(_$RegisterInputValidated value,
          $Res Function(_$RegisterInputValidated) then) =
      __$$RegisterInputValidatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterInputValidatedCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterInputValidated>
    implements _$$RegisterInputValidatedCopyWith<$Res> {
  __$$RegisterInputValidatedCopyWithImpl(_$RegisterInputValidated _value,
      $Res Function(_$RegisterInputValidated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterInputValidated implements RegisterInputValidated {
  const _$RegisterInputValidated();

  @override
  String toString() {
    return 'RegisterState.validated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterInputValidated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function(String message) error,
    required TResult Function() validated,
  }) {
    return validated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? idle,
    TResult? Function(String message)? error,
    TResult? Function()? validated,
  }) {
    return validated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function(String message)? error,
    TResult Function()? validated,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInit value) init,
    required TResult Function(RegisterLoading value) loading,
    required TResult Function(RegisterIdle value) idle,
    required TResult Function(RegisterError value) error,
    required TResult Function(RegisterInputValidated value) validated,
  }) {
    return validated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInit value)? init,
    TResult? Function(RegisterLoading value)? loading,
    TResult? Function(RegisterIdle value)? idle,
    TResult? Function(RegisterError value)? error,
    TResult? Function(RegisterInputValidated value)? validated,
  }) {
    return validated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInit value)? init,
    TResult Function(RegisterLoading value)? loading,
    TResult Function(RegisterIdle value)? idle,
    TResult Function(RegisterError value)? error,
    TResult Function(RegisterInputValidated value)? validated,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated(this);
    }
    return orElse();
  }
}

abstract class RegisterInputValidated implements RegisterState {
  const factory RegisterInputValidated() = _$RegisterInputValidated;
}
