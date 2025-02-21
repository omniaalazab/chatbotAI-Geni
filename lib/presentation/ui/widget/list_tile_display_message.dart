import 'package:aichatbot/data/models/chat_message_model.dart';
import 'package:aichatbot/extensions/media_query_extension.dart';
import 'package:aichatbot/helper/color_helper.dart';
import 'package:aichatbot/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class ListTileToDisplayMessage extends StatelessWidget {
  const ListTileToDisplayMessage({
    super.key,
    required this.msg,
  });

  final ChatMessage msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth / 100,
        vertical: context.screenHeight / 100,
      ),
      child: ListTile(
        title: Text(msg.message, style: TextStyleHelper.textStylefontSize18),
        subtitle: Text(msg.role == MessageRole.user ? "You" : "AI",
            style: TextStyleHelper.textStylefontSize18),
        tileColor: msg.role == MessageRole.user
            ? ColorHelper.purple
            : ColorHelper.grey,
      ),
    );
  }
}
