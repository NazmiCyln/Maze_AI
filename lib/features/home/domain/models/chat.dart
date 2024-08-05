import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final DateTime created;
  final String content;
  final bool isFromUser;
  final bool isError;

  const Chat({
    required this.created,
    required this.content,
    required this.isFromUser,
    this.isError = false,
  });

  @override
  List<dynamic> get props => [created, content, isFromUser, isError];

  String get role => isFromUser ? 'user' : 'model';

  Chat copyWith({
    DateTime? created,
    String? content,
    bool? isFromUser,
    bool? isError,
  }) {
    return Chat(
      created: created ?? this.created,
      content: content ?? this.content,
      isFromUser: isFromUser ?? this.isFromUser,
      isError: isError ?? this.isError,
    );
  }
}
