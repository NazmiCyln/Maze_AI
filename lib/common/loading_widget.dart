import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../gen/assets.gen.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.r,
      width: 60.r,
      child: Center(
        child: Lottie.asset(
          Assets.animations.darkLoading,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
