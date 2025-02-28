import 'package:aichatbot/extensions/media_query_extension.dart';
import 'package:aichatbot/extensions/navigation_extension.dart';
import 'package:aichatbot/generated/l10n.dart';
import 'package:aichatbot/helper/color_helper.dart';
import 'package:aichatbot/presentation/cubit/localization/localization_cubit.dart';

import 'package:aichatbot/presentation/ui/widget/app_language_row.dart';
import 'package:aichatbot/presentation/ui/widget/back_button_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SwitchLanguage extends StatelessWidget {
  const SwitchLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorHelper.black,
        body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth / 80,
          vertical: context.screenHeight / 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80.w,
              height: 20.h,
              child: BackButtonWithTitle(
                title: S.of(context).language,
                onPressed: () {
                  context.pop();
                },
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            AppLanguageRow(
              imagePath: "assets/images/enflag1.png",
              text: S.of(context).English,
              onTapFunction: () {
                context.read<LocalizationCubit>().switchToEnglish();
              },
            ),
            AppLanguageRow(
              imagePath: "assets/images/arflag.png",
              text: S.of(context).Arabic,
              onTapFunction: () {
                context.read<LocalizationCubit>().switchToArabic();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
