enum MessageRole { user, bot }

class ChatMessage {
  final String message;
  final MessageRole role;
  final DateTime timestamp;

  ChatMessage({
    required this.message,
    required this.role,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'message': message,
        'role': role.toString().split('.').last,
        'timestamp': timestamp.toIso8601String(),
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['message'] as String,
      role: MessageRole.values.firstWhere(
        (e) => e.toString().split('.').last == json['role'],
        orElse: () => MessageRole.bot,
      ),
      timestamp:
          DateTime.tryParse(json['timestamp'] as String) ?? DateTime.now(),
    );
  }
}
