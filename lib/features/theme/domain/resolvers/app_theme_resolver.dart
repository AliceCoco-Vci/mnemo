import '../models/app_theme_definition.dart';

class AppThemeResolver {
  const AppThemeResolver();

  /// 解析当前 App Theme。
  ///
  /// 如果指定主题不存在，则返回默认主题。
  AppThemeDefinition resolve({
    required String? selectedThemeId,
    required Map<String, AppThemeDefinition> themes,
    required AppThemeDefinition defaultTheme,
  }) {
    if (selectedThemeId == null) {
      return defaultTheme;
    }

    return themes[selectedThemeId] ?? defaultTheme;
  }
}
