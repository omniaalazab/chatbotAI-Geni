import 'package:aichatbot/extensions/media_query_extension.dart';
import 'package:aichatbot/extensions/navigation_extension.dart';
import 'package:aichatbot/generated/l10n.dart';

import 'package:aichatbot/presentation/ui/widget/back_button_with_title.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/text_style_helper.dart';

class TemsAndConditionsScreen extends StatelessWidget {
  const TemsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorHelper.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth / 40,
          vertical: context.screenHeight / 100,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 80.w,
                height: 20.h,
                child: BackButtonWithTitle(
                  title: S.of(context).terms_and_conditions,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              Text(S.of(context).terms_item,
                  style: TextStyleHelper.textStylefontSize18),
            ],
          ),
        ),
      ),
    );
  }
}
