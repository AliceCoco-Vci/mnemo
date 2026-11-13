import '../models/app_theme_binding.dart';
import '../models/data_space_appearance.dart';
import '../models/data_space_theme_definition.dart';
import '../enums/theme_binding_mode.dart';

class DataSpaceThemeResolver {
  const DataSpaceThemeResolver();

  /// 解析 DataSpace 最终使用的主题。
  ///
  /// Follow:
  /// 根据当前 App Theme 找到绑定的 DataSpace Theme。
  ///
  /// Custom:
  /// 根据 customThemeId 找到指定主题。
  ///
  /// 如果找不到对应主题，则返回默认 DataSpace Theme。
  DataSpaceThemeDefinition resolve({
    required DataSpaceAppearance appearance,
    required String currentAppThemeId,
    required Map<String, AppThemeBinding> appThemeBindings,
    required Map<String, DataSpaceThemeDefinition> themes,
    required DataSpaceThemeDefinition defaultTheme,
  }) {
    switch (appearance.mode) {
      case ThemeBindingMode.follow:
        return _resolveFollow(
          appThemeId: currentAppThemeId,
          appThemeBindings: appThemeBindings,
          themes: themes,
          defaultTheme: defaultTheme,
        );

      case ThemeBindingMode.custom:
        return _resolveCustom(
          customThemeId: appearance.customThemeId,
          themes: themes,
          defaultTheme: defaultTheme,
        );
    }
  }

  DataSpaceThemeDefinition _resolveFollow({
    required String appThemeId,
    required Map<String, AppThemeBinding> appThemeBindings,
    required Map<String, DataSpaceThemeDefinition> themes,
    required DataSpaceThemeDefinition defaultTheme,
  }) {
    final binding = appThemeBindings[appThemeId];

    if (binding == null) {
      return defaultTheme;
    }

    return themes[binding.dataSpaceThemeId] ?? defaultTheme;
  }

  DataSpaceThemeDefinition _resolveCustom({
    required String? customThemeId,
    required Map<String, DataSpaceThemeDefinition> themes,
    required DataSpaceThemeDefinition defaultTheme,
  }) {
    if (customThemeId == null) {
      return defaultTheme;
    }

    return themes[customThemeId] ?? defaultTheme;
  }
}
