import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../core/models/failure/failure.dart';
import '../../core/models/multimedia_source/multimedia_source.dart';
import '../../features/home/domain/models/pick_file_data.dart';
import 'multimedia.dart';

@LazySingleton(as: Multimedia)
class MultimediaImpl implements Multimedia {
  final ImagePicker imagePicker;

  const MultimediaImpl({required this.imagePicker});

  @override
  Future<Option<Either<Failure, PickFileData>>> pickImage({required MultimediaSource source}) async {
    try {
      XFile? file;
      FilePickerResult? fileResult;

      PickFileData? pickFileData;

      if (source == MultimediaSource.camera) {
        file = await imagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 50,
        );
      } else if (source == MultimediaSource.gallery) {
        fileResult = await FilePicker.platform.pickFiles(
          allowedExtensions: [
            "mp3",
            "wav",
            "aac",
            "flac",
            "wma",
            'png',
            'jpeg',
            "jpg",
            "svg",
            "mp4",
            "avi",
            "mov",
            "wmv",
            "flv",
            "mkv",
            "mpg",
            "mpeg",
          ],
          type: FileType.custom,
          withData: true,
        );
      }

      if (file != null) {
        final bytes = await file.readAsBytes();
        final size = bytes.lengthInBytes;

        pickFileData = PickFileData(
          fileName: file.name,
          filePath: file.path,
          bytes: bytes,
          size: (size / 1024.0).toString(),
        );
      }
      if (fileResult != null) {
        pickFileData = PickFileData(
          fileName: fileResult.files.first.name,
          filePath: fileResult.files.first.path ?? "",
          bytes: fileResult.files.first.bytes,
          size: ((fileResult.files.first.size) / 1024.0).toString(),
        );
      }

      if (pickFileData == null) {
        return none();
      } else {
        return some(right(pickFileData));
      }
    } catch (e) {
      return none();
    }
  }
}
