import 'package:aichatbot/data/models/chat_message_model.dart';
import 'package:aichatbot/data/repository/chat_repository.dart';
import 'package:aichatbot/presentation/cubit/chat/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<ChatState> {
  final ChatRepository repository;
  List<ChatMessage> _history = [];

  HistoryCubit(this.repository) : super(ChatInitial());

  Future<void> loadChatHistory() async {
    emit(ChatLoading([]));
    try {
      _history = await repository.getChatHistory();
      emit(ChatSuccess(_history));
    } catch (e) {
      emit(ChatError("Failed to load chat history", _history));
    }
  }
}
