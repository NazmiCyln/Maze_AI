import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';
import '../models/chat.dart';
import '../models/chat_and_image.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, String>> sendMessage({required String message});

  Stream<Candidates> getStream({required List<Chat> messages});

  Future<Either<Failure, ChatAndImage>> chatAndImage({required ChatAndImage chatAndImage});

  Stream<Candidates> generateContent({required List<ChatAndImage> chatAndImages});
}
