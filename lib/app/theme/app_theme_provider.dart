import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/adapters/app_theme_adapter.dart';
import '../../features/theme/domain/models/app_theme_definition.dart';
import 'app_theme_controller.dart';
import 'app_theme_state.dart';

final appThemeProvider = NotifierProvider<AppThemeController, AppThemeState>(
  AppThemeController.new,
);

/// 当前 App Theme Definition。
final currentAppThemeProvider = Provider<AppThemeDefinition>((ref) {
  return ref.watch(appThemeProvider.select((state) => state.currentTheme));
});

/// 当前 Flutter ThemeData。
final appFlutterThemeProvider = Provider<ThemeData>((ref) {
  final definition = ref.watch(currentAppThemeProvider);

  return const AppThemeAdapter().adapt(definition);
});
