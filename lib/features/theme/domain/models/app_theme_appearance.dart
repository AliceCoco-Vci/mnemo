import '../../../../core/theme/tokens/app/app_color_tokens.dart';
import '../../../../core/theme/tokens/app/app_typography_tokens.dart';
import '../../../../core/theme/tokens/app/app_component_tokens.dart';
import '../../../../core/theme/tokens/app/app_decoration_tokens.dart';

/// App Theme 的单套外观配置。
///
/// 每个 AppThemeDefinition 包含两套 Appearance：
/// - Light Appearance：浅色外观
/// - Dark Appearance：深色外观
///
/// Appearance 只负责描述外观，不负责模式切换。
class AppThemeAppearance {
  /// 颜色配置。
  final AppColorTokens colors;

  /// 字体排版配置。
  final AppTypographyTokens typography;

  /// 组件样式配置。
  final AppComponentTokens components;

  /// 装饰样式配置。
  final AppDecorationTokens decoration;

  const AppThemeAppearance({
    required this.colors,
    required this.typography,
    required this.components,
    required this.decoration,
  });
}
