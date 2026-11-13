import '../models/app_theme_definition.dart';
import '../models/data_space_theme_definition.dart';

import '../../../../core/theme/tokens/app/app_color_tokens.dart';
import '../../../../core/theme/tokens/app/app_typography_tokens.dart';
import '../../../../core/theme/tokens/app/app_component_tokens.dart';
import '../../../../core/theme/tokens/app/app_decoration_tokens.dart';

import '../../../../core/theme/tokens/data_space/data_space_color_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_typography_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_component_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_decoration_tokens.dart';

import '../models/app_theme_binding.dart';

/// Mnemo 内置主题工厂。
///
/// 负责创建系统预置的 App Theme 和 DataSpace Theme。
/// 不负责主题存储、选择、绑定或解析。
class BuiltInThemeFactory {
  const BuiltInThemeFactory._();

  /// 默认 App Theme ID。
  static const String defaultAppThemeId = 'mnemo_default_app';

  /// 默认 DataSpace Theme ID。
  static const String defaultDataSpaceThemeId = 'mnemo_default_data_space';

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

  /// 创建默认 App Theme 与 DataSpace Theme 的绑定。
  static AppThemeBinding createDefaultBinding() {
    return const AppThemeBinding(
      appThemeId: defaultAppThemeId,
      dataSpaceThemeId: defaultDataSpaceThemeId,
    );
  }
}
