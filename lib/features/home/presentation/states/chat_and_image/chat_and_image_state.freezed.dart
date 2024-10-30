// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_and_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatAndImageState {
  Option<Failure> get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ChatAndImage> get messages => throw _privateConstructorUsedError;
  Option<PickFileData> get pickFileData => throw _privateConstructorUsedError;
  Stream<Candidates> get stream => throw _privateConstructorUsedError;

  /// Create a copy of ChatAndImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatAndImageStateCopyWith<ChatAndImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatAndImageStateCopyWith<$Res> {
  factory $ChatAndImageStateCopyWith(
          ChatAndImageState value, $Res Function(ChatAndImageState) then) =
      _$ChatAndImageStateCopyWithImpl<$Res, ChatAndImageState>;
  @useResult
  $Res call(
      {Option<Failure> failure,
      bool isLoading,
      String message,
      List<ChatAndImage> messages,
      Option<PickFileData> pickFileData,
      Stream<Candidates> stream});
}

/// @nodoc
class _$ChatAndImageStateCopyWithImpl<$Res, $Val extends ChatAndImageState>
    implements $ChatAndImageStateCopyWith<$Res> {
  _$ChatAndImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatAndImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? isLoading = null,
    Object? message = null,
    Object? messages = null,
    Object? pickFileData = null,
    Object? stream = null,
  }) {
    return _then(_value.copyWith(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatAndImage>,
      pickFileData: null == pickFileData
          ? _value.pickFileData
          : pickFileData // ignore: cast_nullable_to_non_nullable
              as Option<PickFileData>,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<Candidates>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatAndImageStateImplCopyWith<$Res>
    implements $ChatAndImageStateCopyWith<$Res> {
  factory _$$ChatAndImageStateImplCopyWith(_$ChatAndImageStateImpl value,
          $Res Function(_$ChatAndImageStateImpl) then) =
      __$$ChatAndImageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Failure> failure,
      bool isLoading,
      String message,
      List<ChatAndImage> messages,
      Option<PickFileData> pickFileData,
      Stream<Candidates> stream});
}

/// @nodoc
class __$$ChatAndImageStateImplCopyWithImpl<$Res>
    extends _$ChatAndImageStateCopyWithImpl<$Res, _$ChatAndImageStateImpl>
    implements _$$ChatAndImageStateImplCopyWith<$Res> {
  __$$ChatAndImageStateImplCopyWithImpl(_$ChatAndImageStateImpl _value,
      $Res Function(_$ChatAndImageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatAndImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? isLoading = null,
    Object? message = null,
    Object? messages = null,
    Object? pickFileData = null,
    Object? stream = null,
  }) {
    return _then(_$ChatAndImageStateImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatAndImage>,
      pickFileData: null == pickFileData
          ? _value.pickFileData
          : pickFileData // ignore: cast_nullable_to_non_nullable
              as Option<PickFileData>,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<Candidates>,
    ));
  }
}

/// @nodoc

class _$ChatAndImageStateImpl implements _ChatAndImageState {
  const _$ChatAndImageStateImpl(
      {required this.failure,
      required this.isLoading,
      required this.message,
      required final List<ChatAndImage> messages,
      required this.pickFileData,
      required this.stream})
      : _messages = messages;

  @override
  final Option<Failure> failure;
  @override
  final bool isLoading;
  @override
  final String message;
  final List<ChatAndImage> _messages;
  @override
  List<ChatAndImage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final Option<PickFileData> pickFileData;
  @override
  final Stream<Candidates> stream;

  @override
  String toString() {
    return 'ChatAndImageState(failure: $failure, isLoading: $isLoading, message: $message, messages: $messages, pickFileData: $pickFileData, stream: $stream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatAndImageStateImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.pickFileData, pickFileData) ||
                other.pickFileData == pickFileData) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, isLoading, message,
      const DeepCollectionEquality().hash(_messages), pickFileData, stream);

  /// Create a copy of ChatAndImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatAndImageStateImplCopyWith<_$ChatAndImageStateImpl> get copyWith =>
      __$$ChatAndImageStateImplCopyWithImpl<_$ChatAndImageStateImpl>(
          this, _$identity);
}

abstract class _ChatAndImageState implements ChatAndImageState {
  const factory _ChatAndImageState(
      {required final Option<Failure> failure,
      required final bool isLoading,
      required final String message,
      required final List<ChatAndImage> messages,
      required final Option<PickFileData> pickFileData,
      required final Stream<Candidates> stream}) = _$ChatAndImageStateImpl;

  @override
  Option<Failure> get failure;
  @override
  bool get isLoading;
  @override
  String get message;
  @override
  List<ChatAndImage> get messages;
  @override
  Option<PickFileData> get pickFileData;
  @override
  Stream<Candidates> get stream;

  /// Create a copy of ChatAndImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatAndImageStateImplCopyWith<_$ChatAndImageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
