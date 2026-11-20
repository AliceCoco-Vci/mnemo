import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enums/theme_binding_mode.dart';
import '../../domain/models/data_space_theme_preference.dart';

/// 管理单个 DataSpace 的主题偏好。
class DataSpaceThemePreferenceController
    extends Notifier<DataSpaceThemePreference> {
  DataSpaceThemePreferenceController(this.dataSpaceId);

  final String dataSpaceId;

  @override
  DataSpaceThemePreference build() {
    return const DataSpaceThemePreference(mode: ThemeBindingMode.follow);
  }

  /// 设置为跟随当前 App Theme。
  void followAppTheme() {
    state = const DataSpaceThemePreference(mode: ThemeBindingMode.follow);
  }

  /// 设置为使用自定义 DataSpace Theme。
  void setCustomTheme(String themeId) {
    state = DataSpaceThemePreference(
      mode: ThemeBindingMode.custom,
      customThemeId: themeId,
    );
  }
}

final dataSpaceThemePreferenceProvider =
    NotifierProvider.family<
      DataSpaceThemePreferenceController,
      DataSpaceThemePreference,
      String
    >(DataSpaceThemePreferenceController.new);
