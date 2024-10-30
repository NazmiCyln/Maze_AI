import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/constans.dart';
import '../constants/system_ui_overlay_styles.dart';
import '../constants/text_styles.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primary),
  scaffoldBackgroundColor: bgColor,
  outlinedButtonTheme: _outLinedButtonThemeData,
  filledButtonTheme: _filledButtomThemeData,
  floatingActionButtonTheme: _floatingActionButtonThemeData,
  cupertinoOverrideTheme: _cupertinoThemeData,
  inputDecorationTheme: _inputDecorationTheme,
  bottomSheetTheme: _bottomSheetThemeData,
  primaryColorLight: primary,
  textButtonTheme: _textButtonThemeData,
  actionIconTheme: _actionIconThemeData,
  iconButtonTheme: _iconButtonThemeData,
  dialogBackgroundColor: white,
  dialogTheme: _dialogTheme,
  primaryColor: primary,
  primaryTextTheme: _textTheme,
  popupMenuTheme: _popupMenuThemeData,
  dividerTheme: _dividerThemeData,
  dividerColor: gray,
  listTileTheme: _listTileThemeData,
  checkboxTheme: _checkboxThemeData,
  radioTheme: _radioThemeData,
  appBarTheme: _appBarTheme,
  textTheme: _textTheme,
  useMaterial3: true,
);

final _outLinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size.fromHeight(50.r)),
    backgroundColor: const WidgetStatePropertyAll(bgColor),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),
    side: WidgetStatePropertyAll(
      BorderSide(color: primary, width: 1.r),
    ),
    textStyle: WidgetStatePropertyAll(titleSmall.copyWith(color: primary)),
    foregroundColor: const WidgetStatePropertyAll(primary),
    padding: WidgetStatePropertyAll(EdgeInsets.all(2.r)),
  ),
);

final _filledButtomThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size.fromHeight(56.r)),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return gray;
        } else {
          return primary;
        }
      },
    ),
    side: const WidgetStatePropertyAll(BorderSide.none),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
    ),
    textStyle: WidgetStatePropertyAll(titleSmall),
    foregroundColor: const WidgetStatePropertyAll(white),
    elevation: const WidgetStatePropertyAll(0),
  ),
);

final _popupMenuThemeData = PopupMenuThemeData(
  color: bgColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  elevation: 0,
  textStyle: bodyLarge,
);

final _floatingActionButtonThemeData = FloatingActionButtonThemeData(
  backgroundColor: primary,
  foregroundColor: bgColor,
  elevation: 0,
  focusElevation: 0,
  hoverElevation: 0,
  extendedIconLabelSpacing: 0,
  highlightElevation: 0,
  disabledElevation: 0,
  extendedPadding: EdgeInsets.zero,
  sizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  extendedSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  smallSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  largeSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  iconSize: 36.r,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(100.r),
    ),
  ),
);

const _cupertinoThemeData = CupertinoThemeData(
  primaryColor: primary,
  applyThemeToAll: true,
  scaffoldBackgroundColor: bgColor,
  barBackgroundColor: Colors.white,
  brightness: Brightness.light,
);

final _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: inputArea,
  iconColor: textColor,
  suffixIconColor: textColor,
  prefixIconColor: textColor,
  hintStyle: labelLarge.copyWith(color: textColor),
  labelStyle: labelMedium.copyWith(color: darkBlue),
  errorStyle: labelSmall.copyWith(color: red, fontSize: 10.sp),
  errorMaxLines: 2,
  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
  floatingLabelStyle: bodySmall.copyWith(color: darkBlue),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: cardColor, width: 2.r),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: primary, width: 1.r),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: cardColor, width: 2.r),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: cardColor, width: 1.r),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: red, width: 1.r),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: red, width: 1.r),
  ),
);

final _bottomSheetThemeData = BottomSheetThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
  ),
  showDragHandle: true,
  dragHandleSize: Size(90.w, 4.h),
  dragHandleColor: textColor,
  // backgroundColor: darkGrayD,
  modalBackgroundColor: darkGray,
);

final _textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    foregroundColor: const WidgetStatePropertyAll(primary),
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    textStyle: WidgetStatePropertyAll(bodySmall.copyWith(color: primary, decoration: TextDecoration.underline)),
  ),
);

final _actionIconThemeData = ActionIconThemeData(
  backButtonIconBuilder: (context) => IconButton(
    onPressed: context.router.maybePop,
    // style: _iconButtonStyle,
    icon: Icon(Icons.arrow_back_ios_rounded, color: darkBlue, size: 24.r),
  ),
);

const _iconButtonThemeData = IconButtonThemeData(style: _iconButtonStyle);

const _iconButtonStyle = ButtonStyle(
  foregroundColor: WidgetStatePropertyAll(darkBlue),
  iconColor: WidgetStatePropertyAll(darkBlue),
  padding: WidgetStatePropertyAll(EdgeInsets.zero),
);

final _dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
  contentTextStyle: bodyLarge.copyWith(color: textColor.withOpacity(.8)),
  titleTextStyle: titleSmall,
  backgroundColor: bgColor,
  elevation: 0,
);

final _dividerThemeData = DividerThemeData(
  color: gray,
  thickness: 2.r,
  space: 0,
);

final _listTileThemeData = ListTileThemeData(
  contentPadding: EdgeInsets.symmetric(horizontal: 60.w),
  titleTextStyle: titleSmall,
  subtitleTextStyle: bodyLarge,
  dense: true,
  textColor: textColor,
  tileColor: bgColor,
  horizontalTitleGap: 0,
  iconColor: primary,
);

final _checkboxThemeData = CheckboxThemeData(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  checkColor: const WidgetStatePropertyAll(white),
  shape: RoundedRectangleBorder(
    side: BorderSide(color: primary, width: 1.5.r),
    borderRadius: BorderRadius.circular(4.r),
  ),
  side: BorderSide(color: primary, width: 1.5.r),
  fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) return primary;
    return null;
  }),
);

final _radioThemeData = RadioThemeData(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) return primary;
    return gray;
  }),
);

final _appBarTheme = AppBarTheme(
  iconTheme: _iconThemeData,
  systemOverlayStyle: systemUiOverlayDarkStyle,
  actionsIconTheme: _iconThemeData,
  titleTextStyle: titleLarge,
  foregroundColor: bgColor,
  scrolledUnderElevation: 0,
  elevation: 0,
  centerTitle: true,
  toolbarHeight: kAppBarHeight,
  backgroundColor: Colors.transparent,
);

final _iconThemeData = IconThemeData(
  color: darkBlue,
  size: 100.r,
);

final _textTheme = TextTheme(
  headlineSmall: headlineSmall,
  headlineMedium: headlineMedium,
  headlineLarge: headlineLarge,
  labelSmall: labelSmall,
  labelMedium: labelMedium,
  labelLarge: labelLarge,
  displaySmall: displaySmall,
  displayMedium: displayMedium,
  displayLarge: displayLarge,
  bodySmall: bodySmall,
  bodyMedium: bodyMedium,
  bodyLarge: bodyLarge,
  titleSmall: titleSmall,
  titleMedium: titleMedium,
  titleLarge: titleLarge,
);
