import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_theme_provider.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appState = ref.watch(appThemeProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Profile',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.palette_outlined),
                  title: const Text('Theme'),
                  subtitle: Text(appState.currentTheme.name),
                ),
                const Divider(height: 1),
                RadioGroup<String>(
                  groupValue: appState.currentThemeId,
                  onChanged: (value) {
                    if (value == null) return;

                    ref.read(appThemeProvider.notifier).selectTheme(value);
                  },
                  child: Column(
                    children: appState.themes.values.map((theme) {
                      return RadioListTile<String>(
                        title: Text(theme.name),
                        subtitle: theme.description == null
                            ? null
                            : Text(theme.description!),
                        value: theme.id,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
