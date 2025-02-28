import 'package:aichatbot/data/api/chat_service.dart';
import 'package:aichatbot/data/repository/chat_repository.dart';
import 'package:aichatbot/generated/l10n.dart';
import 'package:aichatbot/helper/color_helper.dart';
import 'package:aichatbot/presentation/cubit/chat/chat_cubit.dart';
import 'package:aichatbot/presentation/cubit/chat/history_cubit.dart';
import 'package:aichatbot/presentation/cubit/localization/localization_cubit.dart';
import 'package:aichatbot/presentation/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'presentation/ui/screens/on_board_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(// or ResponsiveSizer
        builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LocalizationCubit()),
            BlocProvider(
                create: (_) => ChatCubit(ChatRepository(ChatService()))),
            BlocProvider(
                create: (_) => HistoryCubit(ChatRepository(ChatService()))),
            BlocProvider(create: (_) => ThemeCubit()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return BlocBuilder<LocalizationCubit, LocalizationState>(
                  builder: (context, state) {
                return MaterialApp(
                  locale: state.locale,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  themeMode: themeMode,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                    scaffoldBackgroundColor: Colors.white,
                    brightness: Brightness.light,
                  ),
                  darkTheme: ThemeData(
                    primarySwatch: Colors.deepPurple,
                    scaffoldBackgroundColor: ColorHelper.black,
                    brightness: Brightness.dark,
                  ),
                  home: OnBoardScreen(),
                );
              });
            },
          ));
    });
  }
}
