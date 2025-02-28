import 'package:aichatbot/extensions/media_query_extension.dart';

import 'package:aichatbot/helper/text_style_helper.dart';
import 'package:aichatbot/presentation/cubit/chat/chat_state.dart';
import 'package:aichatbot/presentation/cubit/chat/history_cubit.dart';
import 'package:aichatbot/presentation/ui/widget/list_tile_display_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<HistoryCubit>().loadChatHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorHelper.black,
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: context.screenWidth / 100,
            vertical: context.screenHeight / 100),
        padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth / 100,
            vertical: context.screenHeight / 100),
        child: BlocBuilder<HistoryCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ChatSuccess && state.messages.isNotEmpty) {
              return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  final msg = state.messages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTileToDisplayMessage(msg: msg),
                      Text(
                        '${msg.timestamp.day}/${msg.timestamp.month} '
                        '${msg.timestamp.hour}:${msg.timestamp.minute} ',
                        style: TextStyleHelper.textStylefontSize18,
                      ),
                    ],
                  );
                },
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
                          backgroundImage:
                              AssetImage("assets/images/nohistory1.png"),
                        )),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
