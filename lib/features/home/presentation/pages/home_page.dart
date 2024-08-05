import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maze_ai/router/router.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () async {
                  context.pushRoute(const ChatRoute());
                },
                child: Text('askMazeAi'.tr()),
              ),
              SizedBox(height: 24.h),
              FilledButton(
                onPressed: () async {
                  context.pushRoute(const ChatAndImageRoute());
                },
                child: Text('mazeAiImage'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
