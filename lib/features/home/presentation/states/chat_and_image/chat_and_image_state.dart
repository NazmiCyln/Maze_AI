import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';
import '../../../domain/models/chat_and_image.dart';
import '../../../domain/models/pick_file_data.dart';

part 'chat_and_image_state.freezed.dart';

@freezed
class ChatAndImageState with _$ChatAndImageState {
  const factory ChatAndImageState({
    required Option<Failure> failure,
    required bool isLoading,
    required String message,
    required List<ChatAndImage> messages,
    required Option<PickFileData> pickFileData,
    required Stream<Candidates> stream,
  }) = _ChatAndImageState;

  factory ChatAndImageState.initial() {
    return ChatAndImageState(
      failure: none(),
      isLoading: false,
      message: '',
      messages: [],
      pickFileData: none(),
      stream: const Stream.empty(),
    );
  }
}
