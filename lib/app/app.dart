import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme_provider.dart';

class MnemoApp extends ConsumerWidget {
  const MnemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appFlutterThemeProvider);

    return MaterialApp(
      title: 'Mnemo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Scaffold(body: Center(child: Text('Mnemo'))),
    );
  }
}
