import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_theme_provider.dart';

/// 主题列表页面。
class ThemeGalleryPage extends ConsumerWidget {
  const ThemeGalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appThemeProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Themes')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Choose a theme',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),

          Card(
            child: RadioGroup<String>(
              groupValue: appState.currentThemeId,
              onChanged: (value) {
                if (value == null) return;

                ref.read(appThemeProvider.notifier).selectTheme(value);
              },
              child: Column(
                children: appState.themes.values.map((item) {
                  return RadioListTile<String>(
                    title: Text(item.name),
                    subtitle: item.description == null
                        ? null
                        : Text(item.description!),
                    value: item.id,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
