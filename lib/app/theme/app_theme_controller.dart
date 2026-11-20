import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/models/app_theme_mode.dart';
import '../../features/theme/domain/factories/built_in_theme_factory.dart';
import 'app_theme_state.dart';

/// 管理 App Theme 的选择和显示模式。
class AppThemeController extends Notifier<AppThemeState> {
  @override
  AppThemeState build() {
    // 创建内置 App Theme。
    // 一套 App Theme 内部包含 Light 和 Dark 两套 Appearance。
    final defaultTheme = BuiltInThemeFactory.createDefaultAppTheme();

    // 创建该 App Theme 对应的 Light / Dark DataSpace Theme 绑定。
    final defaultBinding = BuiltInThemeFactory.createDefaultBinding();

    return AppThemeState(
      themes: {defaultTheme.id: defaultTheme},
      bindings: {defaultBinding.appThemeId: defaultBinding},
      currentThemeId: defaultTheme.id,
      mode: AppThemeMode.system,
    );
  }

  /// 切换当前 App Theme。
  void selectTheme(String themeId) {
    if (!state.themes.containsKey(themeId)) {
      return;
    }

    if (state.currentThemeId == themeId) {
      return;
    }

    state = state.copyWith(currentThemeId: themeId);
  }

  /// 修改 App Theme 的显示模式。
  void setMode(AppThemeMode mode) {
    if (state.mode == mode) {
      return;
    }

    state = state.copyWith(mode: mode);
  }
}
