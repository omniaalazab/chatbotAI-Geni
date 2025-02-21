import 'package:aichatbot/extensions/media_query_extension.dart';
import 'package:aichatbot/helper/color_helper.dart';

import 'package:aichatbot/presentation/cubit/chat/chat_cubit.dart';
import 'package:aichatbot/presentation/cubit/chat/chat_state.dart';
import 'package:aichatbot/presentation/ui/widget/list_tile_display_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Chat extends StatelessWidget {
  Chat({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.black,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatSuccess && state.messages.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final msg = state.messages[index];
                      return ListTileToDisplayMessage(msg: msg);
                    },
                  );
                } else if (state is ChatError) {
                  return Center(
                    child: Text(
                      "Error: ${state.error}",
                      style: TextStyle(color: ColorHelper.red),
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 70.w,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/nochat1.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth / 100,
              vertical: context.screenHeight / 100,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Ask AI Geni...",
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: ColorHelper.purple,
                  child: IconButton(
                    color: ColorHelper.white,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        context.read<ChatCubit>().sendMessage(_controller.text);
                        _controller.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
