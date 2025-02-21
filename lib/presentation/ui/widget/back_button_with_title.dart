import 'package:aichatbot/helper/color_helper.dart';
import 'package:aichatbot/helper/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

@immutable
class BackButtonWithTitle extends StatelessWidget {
  const BackButtonWithTitle({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: ColorHelper.black,
          child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ColorHelper.white,
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          style: TextStyleHelper.textStylefontSize20,
        ),
      ],
    );
  }
}
