import 'package:aichatbot/helper/color_helper.dart';
import 'package:flutter/material.dart';

import '../../../../helper/text_style_helper.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.buttonText,
      this.arrowIcon = const SizedBox(
        width: .5,
      ),
      required this.onPressedFunction,
      this.sideColor,
      this.alignButton = MainAxisAlignment.center,
      this.widthButton = double.infinity});
  final String buttonText;

  final Color? sideColor;
  final double widthButton;
  final Function()? onPressedFunction;
  final MainAxisAlignment alignButton;
  final Widget arrowIcon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widthButton, 55),
        backgroundColor: ColorHelper.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: SizedBox(
        width: widthButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyleHelper.textStylefontSize18.copyWith(
                color: ColorHelper.purple,
              ),
            ),
            arrowIcon,
          ],
        ),
      ),
    );
  }
}
