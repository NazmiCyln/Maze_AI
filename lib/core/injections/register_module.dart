// ignore_for_file: invalid_annotation_target

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

import '../../env.dart';
import '../../router/router.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter get appRouter;

  @lazySingleton
  Gemini get gemini => Gemini.init(apiKey: Env.apiKey);
}
