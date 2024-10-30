// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i100;

import 'package:flutter_gemini/flutter_gemini.dart' as _i257;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../router/router.dart' as _i295;
import '../../services/multimedia/multimedia.dart' as _i555;
import '../../services/multimedia/multimedia_impl.dart' as _i410;
import '../models/usecases/base_64_encode.dart' as _i112;
import '../models/usecases/usecase.dart' as _i931;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i295.AppRouter>(() => registerModule.appRouter);
    gh.lazySingleton<_i257.Gemini>(() => registerModule.gemini);
    gh.lazySingleton<_i555.Multimedia>(
        () => _i410.MultimediaImpl(imagePicker: gh<_i183.ImagePicker>()));
    gh.lazySingleton<_i931.UseCase<String, _i100.Uint8List>>(
        () => const _i112.Base64Encode());
    gh.lazySingleton<_i0.HomeRepository>(
        () => _i76.HomeRepositoryImpl(gemini: gh<_i257.Gemini>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {
  @override
  _i295.AppRouter get appRouter => _i295.AppRouter();
}
