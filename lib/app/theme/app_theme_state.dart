import '../../../features/theme/domain/models/app_theme_binding.dart';
import '../../../features/theme/domain/models/app_theme_definition.dart';

class AppThemeState {
  final Map<String, AppThemeDefinition> themes;

  final Map<String, AppThemeBinding> bindings;

  final String currentThemeId;

  const AppThemeState({
    required this.themes,
    required this.bindings,
    required this.currentThemeId,
  });

  /// 当前 App Theme。
  AppThemeDefinition get currentTheme {
    return themes[currentThemeId]!;
  }

  AppThemeState copyWith({
    Map<String, AppThemeDefinition>? themes,
    Map<String, AppThemeBinding>? bindings,
    String? currentThemeId,
  }) {
    return AppThemeState(
      themes: themes ?? this.themes,
      bindings: bindings ?? this.bindings,
      currentThemeId: currentThemeId ?? this.currentThemeId,
    );
  }
}
