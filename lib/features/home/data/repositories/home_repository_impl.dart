import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_ai/core/models/failure/failure.dart';
import 'package:maze_ai/features/home/domain/models/chat_and_image.dart';

import '../../../../constants/constans.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/models/chat.dart';
import '../../domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  final NetworkService networkService;
  final Gemini gemini;

  HomeRepositoryImpl({
    required this.networkService,
    required this.gemini,
  });

  @override
  Future<Either<Failure, String>> sendMessage({required String message}) async {
    final geminiInstance = Gemini.instance;

    try {
      final a = await geminiInstance.chat(
        modelName: modelName,
        [
          Content(
            parts: [
              Parts(text: message),
            ],
          ),
        ],
      );

      log("a: $a");

      return right(a?.content?.parts?.first.text ?? '');
    } catch (e) {
      return left(Failure.unknownError(e.toString()));
    }
  }

  @override
  Stream<Candidates> getStream({required List<Chat> messages}) {
    final geminiInstance = Gemini.instance;

    return geminiInstance.streamChat(
      messages
          .whereNotIndexed((index, element) => index == messages.length - 1 && !element.isFromUser)
          .map((e) => Content(parts: [Parts(text: e.content)], role: e.role))
          .toList(),
      modelName: modelName,
    );
  }

  @override
  Future<Either<Failure, ChatAndImage>> chatAndImage({required ChatAndImage chatAndImage}) async {
    final geminiInstance = Gemini.instance;

    try {
      final result = await geminiInstance.textAndImage(
        modelName: modelName,
        text: chatAndImage.content,
        images: chatAndImage.image != null
            ? [
                chatAndImage.image!.bytes!,
              ]
            : [],
      );

      log("result: $result");

      return right(
        ChatAndImage(
          image: null,
          created: chatAndImage.created,
          content: result?.output ?? "",
          isFromUser: false,
        ),
      );
    } catch (e) {
      log("e: $e");

      return left(Failure.unknownError(e.toString()));
    }
  }

  @override
  Stream<Candidates> generateContent({required List<ChatAndImage> chatAndImages}) {
    final geminiInstance = Gemini.instance;

    return geminiInstance.streamGenerateContent(
      chatAndImages[chatAndImages.length - 2].content,
      // images: chatAndImages.map((e) => e.image?.bytes).whereType<Uint8List>().toList(),
      images: chatAndImages[chatAndImages.length - 2].image != null
          ? [chatAndImages[chatAndImages.length - 2].image!.bytes!]
          : [],
      modelName: modelName,
    );
  }
}
