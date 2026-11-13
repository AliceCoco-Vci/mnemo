import '../enums/theme_binding_mode.dart';

class DataSpaceAppearance {
  /// 当前 DataSpace 的主题绑定模式
  final ThemeBindingMode mode;

  /// 自定义主题 ID
  ///
  /// 只有 mode == custom 时才使用。
  /// mode == follow 时不需要保存跟随主题 ID。
  final String? customThemeId;

  const DataSpaceAppearance({
    this.mode = ThemeBindingMode.follow,
    this.customThemeId,
  });
}
