import 'package:aichatbot/helper/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

@immutable
class AppLanguageRow extends StatelessWidget {
  const AppLanguageRow(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTapFunction});
  final String imagePath;
  final String text;
  final void Function()? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Padding(
        padding: EdgeInsets.all(5.h),
        child: Row(
          children: [
            SizedBox(
              height: 5.h,
              width: 5.w,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              text,
              style: TextStyleHelper.textStylefontSize18,
            )
          ],
        ),
      ),
    );
  }
}
