import 'package:flutter/services.dart';

class PickFileData {
  final String fileName;
  final String filePath;
  final Uint8List? bytes;
  final String size;

  const PickFileData({
    required this.fileName,
    required this.filePath,
    this.bytes,
    required this.size,
  });
}
