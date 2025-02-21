import 'package:aichatbot/extensions/navigation_extension.dart';
import 'package:aichatbot/generated/l10n.dart';
import 'package:aichatbot/helper/text_style_helper.dart';
import 'package:aichatbot/presentation/ui/screens/home_screen.dart';

import 'package:aichatbot/presentation/ui/screens/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../extensions/media_query_extension.dart';
import '../../../helper/color_helper.dart';
import '../widget/common_widget/custom_elevated_button.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth / 100,
            vertical: context.screenHeight / 100,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: Image.asset(
                    "assets/images/boardimage.png",
                    height: 40.h,
                    width: 80.w,
                  ),
                ),
                Text(S.of(context).welcome_to_ai_chatbot,
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.textStylefontSize24.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                CustomElevatedButton(
                  buttonText: S.of(context).get_started,
                  widthButton: 70.w,
                  onPressedFunction: () {
                    context.push(HomeScreen());
                  },
                ),
                TextButton(
                    onPressed: () {
                      context.push(TemsAndConditionsScreen());
                    },
                    child: Text(
                      S.of(context).terms_and_conditions,
                      style: TextStyleHelper.textStylefontSize18,
                    )),
              ]),
        ));
  }
}
