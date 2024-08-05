import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maze_ai/constants/colors.dart';
import 'package:maze_ai/core/extensions/context_extensions.dart';
import 'package:maze_ai/custom/custom_app_bar.dart';
import 'package:maze_ai/custom/custom_text_field.dart';

import '../../domain/models/chat.dart';
import '../providers/chat_provider.dart';
import '../widgets/chat_item.dart';
import '../widgets/empty_widget.dart';

@RoutePage()
class ChatPage extends HookConsumerWidget {
  const ChatPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);

    final textController = useTextEditingController();
    final scrollController = useScrollController();
    final focusNode = useFocusNode();

    return Scaffold(
      appBar: CustomAppBar(title: 'askMazeAi'.tr()),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: state.messages.isEmpty
                  ? const EmptyWidget()
                  : ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 12.h),
                      padding: EdgeInsets.only(bottom: context.bottomPadding + 16.h),
                      itemCount: state.messages.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final value = state.messages[index];
                        final isLastItem = index == state.messages.length - 1;

                        if (isLastItem) {
                          return GeminiResponseTypeView(
                            key: ValueKey(index),
                            builder: (context, child, response, loading) {
                              scrollController.animateTo(
                                scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );

                              return ChatItem(
                                chat: Chat(
                                  created: DateTime.now(),
                                  content: value.copyWith(content: response ?? '').content,
                                  isFromUser: false,
                                ),
                              );
                            },
                          );
                        }

                        return ChatItem(chat: value);
                      },
                    ),
            ),
          ),
          _MessageField(
            textController: textController,
            scrollController: scrollController,
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }
}

class _MessageField extends ConsumerWidget {
  const _MessageField({
    required this.textController,
    required this.scrollController,
    required this.focusNode,
  });

  final TextEditingController textController;
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: inputArea,
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
          bottom: 10.h,
        ),
        child: CustomTextField(
          onTap: () async {
            await Future.delayed(const Duration(milliseconds: 400));

            await scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          readOnly: state.isLoading,
          controller: textController,
          onChanged: notifier.onMessageChanged,
          onFieldSubmitted: notifier.onMessageChanged,
          onSaved: notifier.onMessageChanged,
          onEditingComplete: () async => onPressed(textController, scrollController, ref),
          hintText: 'enterMessage'.tr(),
          focusNode: focusNode,
          suffixIcon: IconButton(
            onPressed: state.isLoading ? null : () => onPressed(textController, scrollController, ref),
            icon: const Icon(Icons.send, color: primary),
          ),
        ),
      ),
    );
  }

  Future<void> onPressed(TextEditingController textController, ScrollController scrollController, WidgetRef ref) async {
    ref.read(chatProvider.notifier).addMessage();

    textController.clear();

    scrollController.jumpTo(scrollController.position.maxScrollExtent + 200);

    ref.read(chatProvider.notifier).startStream();
  }
}
