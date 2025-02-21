import 'package:aichatbot/extensions/media_query_extension.dart';
import 'package:aichatbot/generated/l10n.dart';
import 'package:aichatbot/helper/color_helper.dart';
import 'package:aichatbot/helper/text_style_helper.dart';
import 'package:aichatbot/presentation/ui/screens/chat.dart';
import 'package:aichatbot/presentation/ui/screens/history.dart';
import 'package:aichatbot/presentation/ui/screens/settings.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// HomeScreen.dart
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectedIndex = 0; // Track selected menu item

  // Define pages
  final List<Widget> pages = [
    Chat(),
    History(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorHelper.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth / 100,
            vertical: context.screenHeight / 70,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).chatAI,
                    style: TextStyleHelper.textStylefontSize24,
                  ),
                  SettingsMenuItem(
                    icon: Icons.add_box,
                    isSelected: false,
                    title: "pro",
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              // Row of menu items
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SettingsMenuItem(
                      icon: Icons.chat,
                      title: S.of(context).chat,
                      isSelected: selectedIndex == 0,
                      onTap: () => setState(() => selectedIndex = 0),
                    ),
                    SettingsMenuItem(
                      icon: Icons.history,
                      title: S.of(context).history,
                      isSelected: selectedIndex == 1,
                      onTap: () => setState(() => selectedIndex = 1),
                    ),
                    SettingsMenuItem(
                      icon: Icons.settings,
                      title: S.of(context).settings,
                      isSelected: selectedIndex == 2,
                      onTap: () => setState(() => selectedIndex = 2),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: pages[selectedIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Reusable Settings Menu Item
class SettingsMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SettingsMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ColorHelper.purple : ColorHelper.black1,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.w),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? ColorHelper.white : ColorHelper.grey),
            SizedBox(width: 1.w),
            Text(title,
                style: TextStyleHelper.textStylefontSize18.copyWith(
                  color: isSelected ? ColorHelper.white : ColorHelper.grey,
                )),
          ],
        ),
      ),
    );
  }
}
