import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/adapters/app_theme_adapter.dart';
import '../../core/theme/models/app_theme_mode.dart';
import '../../features/theme/domain/models/app_theme_definition.dart';
import 'app_theme_controller.dart';
import 'app_theme_state.dart';

/// App Theme 状态管理。
final appThemeProvider = NotifierProvider<AppThemeController, AppThemeState>(
  AppThemeController.new,
);

/// 当前 App Theme Definition。
final currentAppThemeProvider = Provider<AppThemeDefinition>((ref) {
  return ref.watch(appThemeProvider.select((state) => state.currentTheme));
});

/// 当前 App Theme 的 Light ThemeData。
final appLightFlutterThemeProvider = Provider<ThemeData>((ref) {
  final definition = ref.watch(currentAppThemeProvider);

  return const AppThemeAdapter().adapt(
    definition.lightAppearance,
    brightness: Brightness.light,
  );
});

/// 当前 App Theme 的 Dark ThemeData。
final appDarkFlutterThemeProvider = Provider<ThemeData>((ref) {
  final definition = ref.watch(currentAppThemeProvider);

  return const AppThemeAdapter().adapt(
    definition.darkAppearance,
    brightness: Brightness.dark,
  );
});

/// 将 AppThemeMode 转换为 Flutter ThemeMode。
final appFlutterThemeModeProvider = Provider<ThemeMode>((ref) {
  final mode = ref.watch(appThemeProvider.select((state) => state.mode));

  switch (mode) {
    case AppThemeMode.system:
      return ThemeMode.system;

    case AppThemeMode.light:
      return ThemeMode.light;

    case AppThemeMode.dark:
      return ThemeMode.dark;
  }
});
