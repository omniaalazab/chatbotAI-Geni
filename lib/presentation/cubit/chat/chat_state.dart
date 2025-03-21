import 'package:aichatbot/data/models/chat_message_model.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  final List<ChatMessage> messages;
  ChatLoading(this.messages);
}

class ChatSuccess extends ChatState {
  final List<ChatMessage> messages;
  ChatSuccess(this.messages);
}

class ChatError extends ChatState {
  final String error;
  final List<ChatMessage> messages;
  ChatError(this.error, this.messages);
}
