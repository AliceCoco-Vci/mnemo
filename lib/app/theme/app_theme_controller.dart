import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/theme/domain/factories/built_in_theme_factory.dart';
import 'app_theme_state.dart';

class AppThemeController extends Notifier<AppThemeState> {
  @override
  AppThemeState build() {
    // 创建内置 App Themes。
    final lightTheme = BuiltInThemeFactory.createDefaultAppTheme();

    final darkTheme = BuiltInThemeFactory.createDarkAppTheme();

    // 创建内置 App Theme Bindings。
    final lightBinding = BuiltInThemeFactory.createDefaultBinding();

    final darkBinding = BuiltInThemeFactory.createDarkBinding();

    return AppThemeState(
      themes: {lightTheme.id: lightTheme, darkTheme.id: darkTheme},
      bindings: {
        lightBinding.appThemeId: lightBinding,
        darkBinding.appThemeId: darkBinding,
      },
      currentThemeId: BuiltInThemeFactory.defaultAppThemeId,
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
}
