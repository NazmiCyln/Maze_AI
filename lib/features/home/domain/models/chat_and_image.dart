import 'package:maze_ai/features/home/domain/models/chat.dart';

import 'pick_file_data.dart';

class ChatAndImage extends Chat {
  final PickFileData? image;

  const ChatAndImage({
    required this.image,
    required super.created,
    required super.content,
    required super.isFromUser,
  });

  @override
  List<dynamic> get props => [image, super.created, super.content, super.isFromUser, super.isError];

  @override
  ChatAndImage copyWith({
    PickFileData? image,
    DateTime? created,
    String? content,
    bool? isFromUser,
    bool? isError,
  }) {
    return ChatAndImage(
      image: image ?? this.image,
      created: created ?? this.created,
      content: content ?? this.content,
      isFromUser: isFromUser ?? this.isFromUser,
    );
  }
}
