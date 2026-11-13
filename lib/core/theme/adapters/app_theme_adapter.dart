import 'package:flutter/material.dart';

import '../../../features/theme/domain/models/app_theme_definition.dart';
import 'flutter_theme_adapter.dart';

class AppThemeAdapter {
  const AppThemeAdapter();

  ThemeData adapt(AppThemeDefinition definition) {
    final colors = definition.colors;
    final typography = definition.typography;

    final primary = FlutterThemeAdapter.toColor(colors.primary);
    final secondary = FlutterThemeAdapter.toColor(colors.secondary);
    final background = FlutterThemeAdapter.toColor(colors.background);
    final surface = FlutterThemeAdapter.toColor(colors.surface);
    final error = FlutterThemeAdapter.toColor(colors.error);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: surface,
        error: error,
      ),
      scaffoldBackgroundColor: background,
      dividerColor: FlutterThemeAdapter.toColor(colors.divider),
      textTheme: TextTheme(
        headlineSmall: FlutterThemeAdapter.toTextStyle(typography.heading),
        titleMedium: FlutterThemeAdapter.toTextStyle(typography.title),
        bodyMedium: FlutterThemeAdapter.toTextStyle(typography.body),
        bodySmall: FlutterThemeAdapter.toTextStyle(typography.caption),
        labelLarge: FlutterThemeAdapter.toTextStyle(typography.button),
      ),
    );
  }
}
