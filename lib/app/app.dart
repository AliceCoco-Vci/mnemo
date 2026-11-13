import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme_provider.dart';
import '../features/theme/presentation/pages/theme_preview_page.dart';

class MnemoApp extends ConsumerWidget {
  const MnemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appFlutterThemeProvider);

    return MaterialApp(
      title: 'Mnemo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const ThemePreviewPage(),
    );
  }
}
