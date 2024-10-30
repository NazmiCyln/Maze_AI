import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maze_ai/features/home/domain/models/chat_and_image.dart';

import '../../../../core/injections/locator.dart';
import '../../domain/models/pick_file_data.dart';
import '../states/chat_and_image/chat_and_image_state.dart';

final chatAndImageProvider =
    NotifierProvider.autoDispose<ChatAndImageNotifier, ChatAndImageState>(ChatAndImageNotifier.new);

class ChatAndImageNotifier extends AutoDisposeNotifier<ChatAndImageState> {
  ChatAndImageNotifier();

  @override
  ChatAndImageState build() {
    _init();
    return ChatAndImageState.initial();
  }

  Future<void> _init() async {}

  Future<void> sendMessage() async {
    state = state.copyWith(isLoading: true);

    final data =
        await ref.read(homeRepositoryProvider).chatAndImage(chatAndImage: state.messages[state.messages.length - 2]);

    state = state.copyWith(
      messages: data.fold(
        (l) => [
          ...state.messages.sublist(0, state.messages.length - 1),
          state.messages.last.copyWith(content: l.message),
        ],
        (r) => [
          ...state.messages.sublist(0, state.messages.length - 1),
          state.messages.last.copyWith(content: r.content),
        ],
      ),
    );

    state = state.copyWith(isLoading: false, pickFileData: none());
  }

  void onPickFileDataChanged(PickFileData pickFileData) {
    state = state.copyWith(pickFileData: some(pickFileData));
  }

  void onMessageChanged(String? message) {
    state = state.copyWith(message: message ?? '');
  }

  void addMessage() {
    state = state.copyWith(
      messages: [
        ...state.messages,
        ChatAndImage(
          created: DateTime.now(),
          content: state.message,
          isFromUser: true,
          image: state.pickFileData.fold(() => null, (a) => a),
        ),
        ChatAndImage(created: DateTime.now(), content: "", isFromUser: false, image: null),
      ],
    );
  }

  void startStream() {
    state = state.copyWith(isLoading: true);

    final stream = ref.read(homeRepositoryProvider).generateContent(chatAndImages: state.messages);

    state = state.copyWith(stream: stream, pickFileData: none());

    state.stream.listen(
      (event) async {
        if (event.output?.isNotEmpty == true) {
          state = state.copyWith(
            messages: [
              ...state.messages.sublist(0, state.messages.length - 1),
              ChatAndImage(
                created: DateTime.now(),
                content: "${state.messages.last.content.trim()} ${"${event.output?.trim()} "}",
                isFromUser: false,
                image: null,
              ),
            ],
          );
        }
      },
      onDone: () async {
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
