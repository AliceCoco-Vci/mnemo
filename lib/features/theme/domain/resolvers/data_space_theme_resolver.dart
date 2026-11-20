import '../enums/theme_binding_mode.dart';
import '../models/data_space_theme_preference.dart';
import '../models/data_space_theme_definition.dart';

/// DataSpace Theme 解析器。
///
/// 只负责根据 DataSpace 的主题偏好解析最终使用的主题。
///
/// - follow：使用 App Theme 层传入的绑定主题。
/// - custom：使用 DataSpace 自己指定的主题。
///
/// 不负责处理 App Theme 的日夜模式。
class DataSpaceThemeResolver {
  const DataSpaceThemeResolver();

  DataSpaceThemeDefinition resolve({
    required DataSpaceThemePreference preference,

    /// App Theme 层根据当前 Appearance 选出的 DataSpace Theme ID。
    required String? boundDataSpaceThemeId,

    required Map<String, DataSpaceThemeDefinition> themes,
    required DataSpaceThemeDefinition defaultTheme,
  }) {
    switch (preference.mode) {
      case ThemeBindingMode.follow:
        return _resolveTheme(
          themeId: boundDataSpaceThemeId,
          themes: themes,
          defaultTheme: defaultTheme,
        );

      case ThemeBindingMode.custom:
        return _resolveTheme(
          themeId: preference.customThemeId,
          themes: themes,
          defaultTheme: defaultTheme,
        );
    }
  }

  /// 根据主题 ID 获取主题。
  ///
  /// ID 为空或主题不存在时，使用默认主题。
  DataSpaceThemeDefinition _resolveTheme({
    required String? themeId,
    required Map<String, DataSpaceThemeDefinition> themes,
    required DataSpaceThemeDefinition defaultTheme,
  }) {
    if (themeId == null) {
      return defaultTheme;
    }

    return themes[themeId] ?? defaultTheme;
  }
}
