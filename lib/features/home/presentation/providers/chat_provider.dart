import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maze_ai/core/injections/locator.dart';

import '../../domain/models/chat.dart';
import '../states/chat/chat_state.dart';

final chatProvider = NotifierProvider.autoDispose<ChatNotifier, ChatState>(ChatNotifier.new);

class ChatNotifier extends AutoDisposeNotifier<ChatState> {
  ChatNotifier();

  @override
  ChatState build() {
    _init();
    return ChatState.initial();
  }

  Future<void> _init() async {}

  Future<void> sendMessage() async {
    state = state.copyWith(isLoading: true);

    final data = await ref.read(homeRepositoryProvider).sendMessage(message: state.message);

    state = state.copyWith(
      messages: data.fold(
        (l) => [
          ...state.messages,
          Chat(created: DateTime.now(), content: l.message, isError: true, isFromUser: false),
        ],
        (r) => [
          ...state.messages.sublist(0, state.messages.length - 1),
          state.messages.last.copyWith(content: r),
        ],
      ),
    );

    state = state.copyWith(isLoading: false);
  }

  void onMessageChanged(String? message) {
    state = state.copyWith(message: message ?? '');
  }

  void addMessage() {
    state = state.copyWith(
      messages: [
        ...state.messages,
        Chat(created: DateTime.now(), content: state.message, isFromUser: true),
        Chat(created: DateTime.now(), content: "", isFromUser: false),
      ],
    );
  }

  void startStream() {
    state = state.copyWith(isLoading: true);

    final stream = ref.read(homeRepositoryProvider).getStream(messages: state.messages);

    state = state.copyWith(stream: stream);

    state.stream.listen(
      (event) async {
        if (event.output?.isNotEmpty == true) {
          state = state.copyWith(
            messages: [
              ...state.messages.sublist(0, state.messages.length - 1),
              Chat(
                created: DateTime.now(),
                content: state.messages.last.content + (event.output ?? ""),
                isFromUser: false,
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
