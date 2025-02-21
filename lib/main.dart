import 'package:aichatbot/data/api/chat_service.dart';
import 'package:aichatbot/data/repository/chat_repository.dart';
import 'package:aichatbot/generated/l10n.dart';
import 'package:aichatbot/presentation/cubit/chat/chat_cubit.dart';
import 'package:aichatbot/presentation/cubit/localization/localization_cubit.dart';
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
            // BlocProvider(create: (_) => ChatMessageCubit()),
          ],
          child: BlocBuilder<LocalizationCubit, LocalizationState>(
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
              home: OnBoardScreen(),
            );
          }));
    });
  }
}
