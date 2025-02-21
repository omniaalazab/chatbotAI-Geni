import 'dart:convert';

import 'package:aichatbot/data/api/chat_service.dart';
import 'package:aichatbot/data/models/chat_message_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ChatRepository {
  final ChatService chatService;

  ChatRepository(this.chatService);

  Future<List<ChatMessage>> getChatHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? savedHistory = prefs.getString("chatHistory");

      if (savedHistory != null) {
        final List<dynamic> decoded = jsonDecode(savedHistory);
        return decoded
            .map((item) => ChatMessage.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error loading chat history: $e');
      return [];
    }
  }

  Future<void> saveChatHistory(List<ChatMessage> chatHistory) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encoded = jsonEncode(
        chatHistory.map((msg) => msg.toJson()).toList(),
      );
      await prefs.setString("chatHistory", encoded);
    } catch (e) {
      print('Error saving chat history: $e');
      throw Exception('Failed to save chat history');
    }
  }

  Future<String> sendMessage(String message) async {
    return await chatService.sendMessage(message);
  }
}
