import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/system_ui_overlay_styles.dart';
import 'core/injections/locator.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await EasyLocalization.ensureInitialized();

      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayLightStyle);

      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
      configureDependencies();

      runApp(
        ProviderScope(
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
