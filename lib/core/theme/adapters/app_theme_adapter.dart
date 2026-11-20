import 'package:flutter/material.dart';

import '../../../features/theme/domain/models/app_theme_appearance.dart';
import 'flutter_theme_adapter.dart';

/// 将 App Theme Appearance 转换为 Flutter ThemeData。
///
/// 只负责适配，不负责选择主题或判断日夜模式。
class AppThemeAdapter {
  const AppThemeAdapter();

  ThemeData adapt(
    AppThemeAppearance appearance, {
    required Brightness brightness,
  }) {
    final colors = appearance.colors;
    final typography = appearance.typography;

    final primary = FlutterThemeAdapter.toColor(colors.primary);
    final secondary = FlutterThemeAdapter.toColor(colors.secondary);
    final background = FlutterThemeAdapter.toColor(colors.background);
    final surface = FlutterThemeAdapter.toColor(colors.surface);
    final error = FlutterThemeAdapter.toColor(colors.error);
    final textPrimary = FlutterThemeAdapter.toColor(colors.textPrimary);
    final textSecondary = FlutterThemeAdapter.toColor(colors.textSecondary);

    // 根据明确传入的亮度构建 ColorScheme。
    final ColorScheme colorScheme;

    if (brightness == Brightness.dark) {
      colorScheme = ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        error: error,
        onSurface: textPrimary,
        onSurfaceVariant: textSecondary,
      );
    } else {
      colorScheme = ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: surface,
        error: error,
        onSurface: textPrimary,
        onSurfaceVariant: textSecondary,
      );
    }

    final textTheme = TextTheme(
      headlineSmall: FlutterThemeAdapter.toTextStyle(typography.heading),
      titleMedium: FlutterThemeAdapter.toTextStyle(typography.title),
      bodyMedium: FlutterThemeAdapter.toTextStyle(typography.body),
      bodySmall: FlutterThemeAdapter.toTextStyle(typography.caption),
      labelLarge: FlutterThemeAdapter.toTextStyle(typography.button),
    ).apply(bodyColor: textPrimary, displayColor: textPrimary);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      dividerColor: FlutterThemeAdapter.toColor(colors.divider),
      textTheme: textTheme,
    );
  }
}
