import 'package:aichatbot/data/models/chat_message_model.dart';
import 'package:aichatbot/data/repository/chat_repository.dart';

import 'package:aichatbot/presentation/cubit/chat/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;
  List<ChatMessage> _messages = [];

  ChatCubit(this.repository) : super(ChatInitial()) {
    loadChatHistory();
  }

  Future<void> loadChatHistory() async {
    try {
      _messages = await repository.getChatHistory();
      emit(ChatSuccess(_messages));
    } catch (e) {
      emit(ChatError("Failed to load chat history", _messages));
    }
  }

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;

    final userMessage = ChatMessage(
      message: message,
      role: MessageRole.user,
    );
    _messages.add(userMessage);
    emit(ChatLoading(_messages));

    try {
      await repository.saveChatHistory(_messages);

      final response = await repository.sendMessage(message);

      final botMessage = ChatMessage(
        message: response,
        role: MessageRole.bot,
      );
      _messages.add(botMessage);

      await repository.saveChatHistory(_messages);

      emit(ChatSuccess(_messages));
    } catch (e) {
      print('Error in sendMessage: $e');
      emit(ChatError("Failed to send message", _messages));
    }
  }
}
