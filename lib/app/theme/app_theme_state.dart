import '../../../core/theme/models/app_theme_mode.dart';
import '../../../features/theme/domain/models/app_theme_binding.dart';
import '../../../features/theme/domain/models/app_theme_definition.dart';

/// App Theme 的全局状态。
class AppThemeState {
  /// 所有可用的 App Theme。
  final Map<String, AppThemeDefinition> themes;

  /// 所有 App Theme 对应的 DataSpace Theme 绑定。
  ///
  /// key 为 appThemeId。
  /// 每个绑定同时包含 Light 和 Dark 两套 DataSpace Theme。
  final Map<String, AppThemeBinding> bindings;

  /// 当前选中的 App Theme ID。
  final String currentThemeId;

  /// 当前 App Theme 的显示模式。
  final AppThemeMode mode;

  const AppThemeState({
    required this.themes,
    required this.bindings,
    required this.currentThemeId,
    this.mode = AppThemeMode.system,
  });

  /// 当前 App Theme。
  AppThemeDefinition get currentTheme {
    return themes[currentThemeId]!;
  }

  /// 当前 App Theme 的绑定关系。
  AppThemeBinding? get currentBinding {
    return bindings[currentThemeId];
  }

  AppThemeState copyWith({
    Map<String, AppThemeDefinition>? themes,
    Map<String, AppThemeBinding>? bindings,
    String? currentThemeId,
    AppThemeMode? mode,
  }) {
    return AppThemeState(
      themes: themes ?? this.themes,
      bindings: bindings ?? this.bindings,
      currentThemeId: currentThemeId ?? this.currentThemeId,
      mode: mode ?? this.mode,
    );
  }
}
