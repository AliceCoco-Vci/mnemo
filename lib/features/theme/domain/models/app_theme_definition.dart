import 'app_theme_appearance.dart';

/// App Theme 定义。
///
/// 一个 App Theme 是一套完整的主题设计，
/// 内部包含 Light 和 Dark 两种外观。
///
/// 日夜模式由 App Theme 的使用设置决定，
/// 不属于 Theme Definition 本身。
class AppThemeDefinition {
  /// 主题唯一 ID。
  final String id;

  /// 主题名称。
  final String name;

  /// 主题描述。
  final String? description;

  /// 主题定义版本。
  final int version;

  /// 浅色外观配置。
  final AppThemeAppearance lightAppearance;

  /// 深色外观配置。
  final AppThemeAppearance darkAppearance;

  /// 是否为系统内置主题。
  final bool isBuiltIn;

  /// 创建时间。
  final DateTime createdAt;

  /// 最后更新时间。
  final DateTime updatedAt;

  const AppThemeDefinition({
    required this.id,
    required this.name,
    this.description,
    this.version = 1,
    required this.lightAppearance,
    required this.darkAppearance,
    this.isBuiltIn = false,
    required this.createdAt,
    required this.updatedAt,
  });
}
