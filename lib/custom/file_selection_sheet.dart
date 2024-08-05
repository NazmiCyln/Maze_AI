import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maze_ai/constants/colors.dart';
import 'package:maze_ai/core/extensions/context_extensions.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/failure/failure.dart';
import '../../../../core/models/multimedia_source/multimedia_source.dart';
import '../../../../gen/assets.gen.dart';
import '../features/home/domain/models/pick_file_data.dart';

class FileSelectionSheet extends ConsumerWidget {
  const FileSelectionSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const _Camera(),
                  SizedBox(width: 10.w),
                  const _Gallery(),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 16.h),
            ],
          ),
        ),
      ],
    );
  }

  Future<Option<Either<Failure, PickFileData>>> show(BuildContext context) async {
    final result = await showModalBottomSheet<Option<Either<Failure, PickFileData>>>(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      backgroundColor: darkGray.withOpacity(.8),
      builder: (context) => this,
      constraints: BoxConstraints(maxHeight: 0.74.sh),
    );

    return result ?? none();
  }
}

class _Camera extends ConsumerWidget {
  const _Camera();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Item(
      onTap: () async =>
          context.maybePop(await ref.read(multimediaProvider).pickImage(source: MultimediaSource.camera)),
      icon: Assets.icons.cameraIcon,
      title: 'openCamera'.tr(),
    );
  }
}

class _Gallery extends ConsumerWidget {
  const _Gallery();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Item(
      onTap: () async =>
          context.maybePop(await ref.read(multimediaProvider).pickImage(source: MultimediaSource.gallery)),
      icon: Assets.icons.galleryIcon,
      title: 'selectFromDevice'.tr(),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final VoidCallback onTap;
  final SvgGenImage icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 111.h,
          decoration: BoxDecoration(
            color: gray,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.svg(),
              SizedBox(height: 12.h),
              Text(
                title,
                style: context.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
