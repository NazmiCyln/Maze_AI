import 'package:fpdart/fpdart.dart';

import '../../core/models/failure/failure.dart';
import '../../core/models/multimedia_source/multimedia_source.dart';
import '../../features/home/domain/models/pick_file_data.dart';

abstract class Multimedia {
  Future<Option<Either<Failure, PickFileData>>> pickImage({required MultimediaSource source});
}
