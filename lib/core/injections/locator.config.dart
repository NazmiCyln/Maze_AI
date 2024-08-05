// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i100;

import 'package:cross_connectivity/cross_connectivity.dart' as _i318;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_gemini/flutter_gemini.dart' as _i257;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../router/router.dart' as _i295;
import '../../services/jwt/jwt_service.dart' as _i769;
import '../../services/jwt/jwt_service_impl.dart' as _i47;
import '../../services/locale/locale_resources_service.dart' as _i354;
import '../../services/locale/locale_resources_service_impl.dart' as _i94;
import '../../services/multimedia/multimedia.dart' as _i555;
import '../../services/multimedia/multimedia_impl.dart' as _i410;
import '../../services/network/network_info.dart' as _i538;
import '../../services/network/network_info_impl.dart' as _i184;
import '../../services/network/network_service.dart' as _i298;
import '../../services/network/network_service_impl.dart' as _i669;
import '../models/usecases/base_64_encode.dart' as _i112;
import '../models/usecases/usecase.dart' as _i931;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i354.LocaleResourcesService>(
        () => _i94.LocaleResourcesServiceImpl(
              secureStorage: gh<_i558.FlutterSecureStorage>(),
              sharedPreferences: gh<_i460.SharedPreferences>(),
            ));
    gh.lazySingleton<_i295.AppRouter>(() => registerModule.appRouter);
    gh.lazySingleton<_i318.Connectivity>(() => registerModule.connectivity);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i257.Gemini>(() => registerModule.gemini);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i555.Multimedia>(
        () => _i410.MultimediaImpl(imagePicker: gh<_i183.ImagePicker>()));
    gh.lazySingleton<_i769.JwtService>(() => _i47.JwtServiceImpl());
    gh.lazySingleton<_i538.NetworkInfo>(
        () => _i184.NetworkInfoImpl(connectivity: gh<_i318.Connectivity>()));
    gh.lazySingleton<_i931.UseCase<String, _i100.Uint8List>>(
        () => const _i112.Base64Encode());
    gh.lazySingleton<_i298.NetworkService>(() => _i669.NetworkServiceImpl(
          gh<_i361.Dio>(),
          localeResourcesService: gh<_i354.LocaleResourcesService>(),
          networkInfo: gh<_i538.NetworkInfo>(),
        ));
    gh.lazySingleton<_i0.HomeRepository>(() => _i76.HomeRepositoryImpl(
          networkService: gh<_i298.NetworkService>(),
          gemini: gh<_i257.Gemini>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {
  @override
  _i295.AppRouter get appRouter => _i295.AppRouter();

  @override
  _i318.Connectivity get connectivity => _i318.Connectivity();
}