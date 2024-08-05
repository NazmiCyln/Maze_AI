import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';
import '../../../domain/models/chat.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required Option<Failure> failure,
    required bool isLoading,
    required String message,
    required List<Chat> messages,
    required Stream<Candidates> stream,
  }) = _ChatState;

  factory ChatState.initial() {
    return ChatState(
      failure: none(),
      isLoading: false,
      message: '',
      messages: [],
      stream: const Stream.empty(),
    );
  }
}
