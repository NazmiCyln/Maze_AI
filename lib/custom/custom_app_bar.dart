import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_ai/constants/colors.dart';
import 'package:maze_ai/core/extensions/context_extensions.dart' as ctx;

import '../constants/constans.dart';
import '../constants/system_ui_overlay_styles.dart';
import '../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final double? leadingWidth;
  final double bottomHeight;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackPressed;
  final Widget? titleWitdget;

  const CustomAppBar({
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.bottom,
    this.bottomHeight = 0,
    this.onBackPressed,
    this.titleWitdget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWitdget ??
          (title != null
              ? Text(
                  title!,
                  style: context.displayMedium,
                  overflow: TextOverflow.ellipsis,
                )
              : null),
      leading: leading ??
          (context.router.canPop()
              ? IconButton.filled(
                  onPressed: onBackPressed ?? () => context.maybePop(),
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  icon: Assets.icons.arrowHeadLeft.svg(
                    colorFilter: const ColorFilter.mode(darkBlue, BlendMode.srcIn),
                    width: 11.r,
                  ),
                )
              : null),
      systemOverlayStyle: systemUiOverlayLightStyle,
      toolbarHeight: 52.h,
      leadingWidth: leadingWidth ?? 58.w,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kAppBarHeight + bottomHeight + 24.h);
}
