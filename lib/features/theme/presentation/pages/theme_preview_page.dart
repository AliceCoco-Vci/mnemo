import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_theme_provider.dart';
import '../../domain/enums/theme_binding_mode.dart';
import '../../domain/factories/built_in_theme_factory.dart';
import '../providers/data_space_appearance_provider.dart';
import '../providers/data_space_theme_provider.dart';
import '../widgets/data_space_theme_builder.dart';

import '../widgets/data_space_surface.dart';
import '../widgets/data_space_text.dart';
import '../widgets/data_space_divider.dart';

class ThemePreviewPage extends ConsumerWidget {
  const ThemePreviewPage({super.key});

  static const String previewDataSpaceId = 'preview_data_space';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appThemeProvider);
    final appTheme = ref.watch(currentAppThemeProvider);

    final appearance = ref.watch(
      dataSpaceAppearanceProvider(previewDataSpaceId),
    );

    final dataSpaceTheme = ref.watch(
      resolvedDataSpaceThemeProvider(previewDataSpaceId),
    );

    final isDark = appTheme.id == BuiltInThemeFactory.darkAppThemeId;

    return Scaffold(
      appBar: AppBar(title: const Text('Mnemo Theme Preview')),
      body: DataSpaceThemeBuilder(
        dataSpaceId: previewDataSpaceId,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _buildSectionTitle('App Theme'),

            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Current App Theme'),
                    subtitle: Text(appTheme.name),
                    trailing: Text(appTheme.id),
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
                          subtitle: Text(theme.description ?? 'No description'),
                          value: theme.id,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _buildSectionTitle('DataSpace Theme'),

            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Current DataSpace Theme'),
                    subtitle: Text(dataSpaceTheme.name),
                    trailing: Text(dataSpaceTheme.id),
                  ),
                  ListTile(
                    title: const Text('Appearance Mode'),
                    subtitle: Text(
                      appearance.mode == ThemeBindingMode.follow
                          ? 'Follow App Theme'
                          : 'Custom',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _buildSectionTitle('Appearance Settings'),

            FilledButton(
              onPressed: () {
                ref
                    .read(
                      dataSpaceAppearanceProvider(previewDataSpaceId).notifier,
                    )
                    .followAppTheme();
              },
              child: const Text('Follow App Theme'),
            ),

            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: () {
                ref
                    .read(
                      dataSpaceAppearanceProvider(previewDataSpaceId).notifier,
                    )
                    .setCustomTheme(
                      BuiltInThemeFactory.defaultDataSpaceThemeId,
                    );
              },
              child: const Text('Use Default Custom Theme'),
            ),

            const SizedBox(height: 32),

            _buildSectionTitle('DataSpace Widget Preview'),

            DataSpaceSurface(
              variant: DataSpaceSurfaceVariant.background,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DataSpaceText(
                    'DataSpace Preview',
                    variant: DataSpaceTextVariant.heading,
                  ),

                  const SizedBox(height: 12),

                  DataSpaceSurface(
                    variant: DataSpaceSurfaceVariant.card,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DataSpaceText(
                          'My Data Table',
                          variant: DataSpaceTextVariant.title,
                        ),

                        const SizedBox(height: 8),

                        const DataSpaceText('This is a DataSpace themed card.'),

                        const SizedBox(height: 8),

                        const DataSpaceText(
                          'Updated just now',
                          variant: DataSpaceTextVariant.caption,
                        ),

                        const DataSpaceDivider(),

                        const DataSpaceText(
                          'Table Row Example',
                          variant: DataSpaceTextVariant.tableCell,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _buildSectionTitle('Flutter Widget Preview'),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('This is an App Theme card'),
                    const SizedBox(height: 12),
                    Text(isDark ? 'Dark App Theme' : 'Light App Theme'),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Preview Input',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Chip(label: Text('Mnemo')),
                        SizedBox(width: 8),
                        Chip(label: Text('Theme')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
