import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/highlighter.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/models/chat_and_image.dart';

class ImageChatItem extends StatelessWidget {
  const ImageChatItem({required this.chat});

  final ChatAndImage chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: chat.isFromUser ? cardColor.withOpacity(.85) : gray,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: ValueKey(chat.created),
        children: [
          SizedBox(
            height: 30.r,
            width: 30.r,
            child: chat.isFromUser ? Lottie.asset(Assets.animations.question2) : Lottie.asset(Assets.animations.aiAnim),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chat.image != null) ...[
                    Image.memory(
                      chat.image!.bytes!,
                      height: 300.h,
                    ),
                    SizedBox(height: 12.h),
                  ],
                  MarkdownBody(
                    selectable: true,
                    data: chat.content,
                    onTapLink: (text, href, title) async {
                      if (href == null) return;
                      final uri = Uri.parse(href);

                      try {
                        await launchUrl(uri);
                      } catch (e) {
                        if (kDebugMode) print(e);
                      }
                    },
                    onTapText: () {},
                    builders: {
                      'code': Highlight(),
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
