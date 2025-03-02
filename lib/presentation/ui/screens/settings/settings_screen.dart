import 'package:aichatbot/extensions/navigation_extension.dart';
import 'package:aichatbot/generated/l10n.dart';
import 'package:aichatbot/helper/color_helper.dart';
import 'package:aichatbot/helper/text_style_helper.dart';
import 'package:aichatbot/presentation/cubit/theme/theme_cubit.dart';
import 'package:aichatbot/presentation/ui/screens/settings/about_us.dart';
import 'package:aichatbot/presentation/ui/screens/settings/switch_langauage_screen.dart';
import 'package:aichatbot/presentation/ui/screens/settings/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorHelper.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Text(S.of(context).support,
              style: TextStyleHelper.textStylefontSize24),
          SizedBox(
            height: 5.h,
          ),
          SettingContainerRow(
            onPressed: () {
              context.push(AboutUs());
            },
            rowTitle: S.of(context).aboutus,
            icon: Icon(Icons.info_outline),
            color: ColorHelper.cyan,
          ),
          SettingContainerRow(
            onPressed: () {
              context.push(TemsAndConditionsScreen());
            },
            rowTitle: S.of(context).termofuse,
            icon: Icon(Icons.description),
            color: ColorHelper.orange,
          ),
          SettingContainerRow(
            onPressed: () {
              context.push(SwitchLanguage());
            },
            rowTitle: S.of(context).language,
            icon: Icon(Icons.language),
            color: ColorHelper.grey,
          ),
          Row(
            children: [
              Icon(Icons.dark_mode),
              Switch(
                value: context.watch<ThemeCubit>().state == ThemeMode.dark,
                onChanged: (value) {
                  context.read<ThemeCubit>().toggleTheme(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

@immutable
class SettingContainerRow extends StatelessWidget {
  const SettingContainerRow({
    required this.rowTitle,
    required this.onPressed,
    required this.icon,
    required this.color,
    super.key,
  });
  final String rowTitle;
  final Function() onPressed;
  final Icon icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: ColorHelper.black1
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: color,
                      child: icon,
                    ),
                    SizedBox(width: 2.w),
                    Text(rowTitle, style: TextStyleHelper.textStylefontSize18),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorHelper.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
