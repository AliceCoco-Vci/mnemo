import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/theme/domain/factories/built_in_theme_factory.dart';
import 'app_theme_state.dart';

class AppThemeController extends Notifier<AppThemeState> {
  @override
  AppThemeState build() {
    final appTheme = BuiltInThemeFactory.createDefaultAppTheme();

    final binding = BuiltInThemeFactory.createDefaultBinding();

    return AppThemeState(
      themes: {appTheme.id: appTheme},
      bindings: {binding.appThemeId: binding},
      currentThemeId: appTheme.id,
    );
  }

  /// 切换当前 App Theme。
  ///
  /// 如果主题不存在，则忽略本次操作。
  void selectTheme(String themeId) {
    if (!state.themes.containsKey(themeId)) {
      return;
    }

    state = state.copyWith(currentThemeId: themeId);
  }
}
