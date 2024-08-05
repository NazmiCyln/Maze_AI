import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maze_ai/core/extensions/context_extensions.dart';

import '../../../../gen/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(Assets.animations.aiAnim, height: 250.h),
        Text(
          'askAnythingToMazeAi'.tr(),
          style: context.labelLarge,
        ),
      ],
    );
  }
}
