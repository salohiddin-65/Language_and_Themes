import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:language_and_themes/core/theme/dark_mode.dart';
import 'package:language_and_themes/core/theme/light_mode.dart';
import 'package:language_and_themes/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      saveLocale: true,
      startLocale: const Locale('ru'),
      supportedLocales: const [
        Locale('uz'),
        Locale('en'),
        Locale('ru'),
      ],
      path: "lib/core/lang",
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ClickLightThemeMode.theme,
      dark: ClickDarkThemeMode.theme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: "Language and Themes",
          theme: theme,
          darkTheme: darkTheme,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
