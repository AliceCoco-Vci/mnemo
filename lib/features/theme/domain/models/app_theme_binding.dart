/// App Theme 与 DataSpace Theme 的绑定关系。
///
/// 每套 App Theme 可以分别为 Light 和 Dark Appearance
/// 指定一套 DataSpace Theme。
class AppThemeBinding {
  /// App Theme 的 ID。
  final String appThemeId;

  /// Light Appearance 对应的 DataSpace Theme ID。
  final String lightDataSpaceThemeId;

  /// Dark Appearance 对应的 DataSpace Theme ID。
  final String darkDataSpaceThemeId;

  const AppThemeBinding({
    required this.appThemeId,
    required this.lightDataSpaceThemeId,
    required this.darkDataSpaceThemeId,
  });
}
