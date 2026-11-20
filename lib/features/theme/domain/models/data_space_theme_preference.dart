import '../enums/theme_binding_mode.dart';

/// DataSpace 的主题偏好设置。
///
/// 负责描述 DataSpace 使用哪种方式选择主题，
/// 不负责定义主题的视觉样式。
class DataSpaceThemePreference {
  /// 当前 DataSpace 的主题绑定模式。
  final ThemeBindingMode mode;

  /// 自定义 DataSpace Theme ID。
  ///
  /// 只有 mode == custom 时有效。
  /// mode == follow 时为 null。
  final String? customThemeId;

  const DataSpaceThemePreference({
    this.mode = ThemeBindingMode.follow,
    this.customThemeId,
  });
}
