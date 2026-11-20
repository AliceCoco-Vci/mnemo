import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme_provider.dart';
import 'navigation/app_scaffold.dart';

class MnemoApp extends ConsumerWidget {
  const MnemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 当前 App Theme 的浅色外观。
    final lightTheme = ref.watch(appLightFlutterThemeProvider);

    // 当前 App Theme 的深色外观。
    final darkTheme = ref.watch(appDarkFlutterThemeProvider);

    // 当前 App Theme 的显示模式。
    final themeMode = ref.watch(appFlutterThemeModeProvider);

    return MaterialApp(
      title: 'Mnemo',
      debugShowCheckedModeBanner: false,

      // 浅色主题。
      theme: lightTheme,

      // 深色主题。
      darkTheme: darkTheme,

      // System / Light / Dark。
      themeMode: themeMode,

      home: const AppScaffold(),
    );
  }
}
