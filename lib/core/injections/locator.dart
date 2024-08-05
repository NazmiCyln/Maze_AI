import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../router/router.dart';
import '../../services/locale/locale_resources_service.dart';
import '../../services/multimedia/multimedia.dart';
import '../../services/multimedia/multimedia_impl.dart';
import 'locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() => getIt.init();

final appRouterProvider = Provider.autoDispose((ref) => getIt<AppRouter>());

final localeResourcesServiceProvider = Provider.autoDispose((ref) => getIt<LocaleResourcesService>());

final homeRepositoryProvider = Provider.autoDispose((ref) => getIt<HomeRepository>());

final _imagePickerProvider = Provider.autoDispose((ref) => ImagePicker());

final multimediaProvider = Provider.autoDispose<Multimedia>(
  (ref) => MultimediaImpl(imagePicker: ref.watch(_imagePickerProvider)),
);
