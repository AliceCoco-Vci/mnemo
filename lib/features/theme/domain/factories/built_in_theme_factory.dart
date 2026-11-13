import '../models/app_theme_definition.dart';
import '../models/data_space_theme_definition.dart';
import '../models/app_theme_binding.dart';
import '../../../../core/theme/tokens/common/theme_color.dart';

import '../../../../core/theme/tokens/app/app_color_tokens.dart';
import '../../../../core/theme/tokens/app/app_typography_tokens.dart';
import '../../../../core/theme/tokens/app/app_component_tokens.dart';
import '../../../../core/theme/tokens/app/app_decoration_tokens.dart';

import '../../../../core/theme/tokens/data_space/data_space_color_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_typography_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_component_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_decoration_tokens.dart';

/// Mnemo 内置主题工厂。
///
/// 负责创建系统预置的 App Theme 和 DataSpace Theme。
/// 不负责主题存储、选择、绑定或解析。
class BuiltInThemeFactory {
  const BuiltInThemeFactory._();

  // --------------------------------------------------
  // Theme IDs
  // --------------------------------------------------

  /// 默认 App Theme ID。
  static const String defaultAppThemeId = 'mnemo_default_app';

  /// 深色 App Theme ID。
  static const String darkAppThemeId = 'mnemo_dark_app';

  /// 默认 DataSpace Theme ID。
  static const String defaultDataSpaceThemeId = 'mnemo_default_data_space';

  /// 简约 DataSpace Theme ID。
  static const String minimalDataSpaceThemeId = 'mnemo_minimal_data_space';

  // --------------------------------------------------
  // App Themes
  // --------------------------------------------------

  /// 创建默认 App Theme。
  static AppThemeDefinition createDefaultAppTheme() {
    final now = DateTime.now();

    return AppThemeDefinition(
      id: defaultAppThemeId,
      name: 'Mnemo Light',
      description: 'Mnemo default application theme.',
      version: 1,
      colors: const AppColorTokens(),
      typography: const AppTypographyTokens(),
      components: const AppComponentTokens(),
      decoration: const AppDecorationTokens(),
      isBuiltIn: true,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 创建深色 App Theme。
  static AppThemeDefinition createDarkAppTheme() {
    final now = DateTime.now();

    return AppThemeDefinition(
      id: darkAppThemeId,
      name: 'Mnemo Dark',
      description: 'Mnemo dark application theme.',
      version: 1,
      colors: const AppColorTokens(
        background: ThemeColor('#111318'),
        surface: ThemeColor('#1B1E26'),
        surfaceElevated: ThemeColor('#252936'),
        primary: ThemeColor('#818CF8'),
        secondary: ThemeColor('#A78BFA'),
        textPrimary: ThemeColor('#F9FAFB'),
        textSecondary: ThemeColor('#A1A1AA'),
        textDisabled: ThemeColor('#71717A'),
        divider: ThemeColor('#303541'),
        error: ThemeColor('#F87171'),
        success: ThemeColor('#34D399'),
      ),
      typography: const AppTypographyTokens(),
      components: const AppComponentTokens(),
      decoration: const AppDecorationTokens(),
      isBuiltIn: true,
      createdAt: now,
      updatedAt: now,
    );
  }

  // --------------------------------------------------
  // DataSpace Themes
  // --------------------------------------------------

  /// 创建默认 DataSpace Theme。
  static DataSpaceThemeDefinition createDefaultDataSpaceTheme() {
    final now = DateTime.now();

    return DataSpaceThemeDefinition(
      id: defaultDataSpaceThemeId,
      name: 'Mnemo Data',
      description: 'Mnemo default data space theme.',
      version: 1,
      colors: const DataSpaceColorTokens(),
      typography: const DataSpaceTypographyTokens(),
      components: const DataSpaceComponentTokens(),
      decoration: const DataSpaceDecorationTokens(),
      isBuiltIn: true,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 创建简约 DataSpace Theme。
  static DataSpaceThemeDefinition createMinimalDataSpaceTheme() {
    final now = DateTime.now();

    return DataSpaceThemeDefinition(
      id: minimalDataSpaceThemeId,
      name: 'Mnemo Minimal',
      description: 'Minimal and neutral data space theme.',
      version: 1,
      colors: const DataSpaceColorTokens(
        background: ThemeColor('#FAFAF9'),
        surface: ThemeColor('#FFFFFF'),
        surfaceElevated: ThemeColor('#FFFFFF'),
        primary: ThemeColor('#57534E'),
        secondary: ThemeColor('#78716C'),
        textPrimary: ThemeColor('#292524'),
        textSecondary: ThemeColor('#78716C'),
        textDisabled: ThemeColor('#A8A29E'),
        divider: ThemeColor('#E7E5E4'),
        error: ThemeColor('#DC2626'),
        success: ThemeColor('#16A34A'),
      ),
      typography: const DataSpaceTypographyTokens(),
      components: const DataSpaceComponentTokens(),
      decoration: const DataSpaceDecorationTokens(),
      isBuiltIn: true,
      createdAt: now,
      updatedAt: now,
    );
  }

  // --------------------------------------------------
  // App Theme Bindings
  // --------------------------------------------------

  /// 默认 App Theme 对应默认 DataSpace Theme。
  static AppThemeBinding createDefaultBinding() {
    return const AppThemeBinding(
      appThemeId: defaultAppThemeId,
      dataSpaceThemeId: defaultDataSpaceThemeId,
    );
  }

  /// 深色 App Theme 对应简约 DataSpace Theme。
  static AppThemeBinding createDarkBinding() {
    return const AppThemeBinding(
      appThemeId: darkAppThemeId,
      dataSpaceThemeId: minimalDataSpaceThemeId,
    );
  }
}
