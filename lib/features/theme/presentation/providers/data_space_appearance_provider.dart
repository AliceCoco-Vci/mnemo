import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enums/theme_binding_mode.dart';
import '../../domain/models/data_space_appearance.dart';

class DataSpaceAppearanceController extends Notifier<DataSpaceAppearance> {
  DataSpaceAppearanceController(this.dataSpaceId);

  final String dataSpaceId;

  @override
  DataSpaceAppearance build() {
    return const DataSpaceAppearance(mode: ThemeBindingMode.follow);
  }

  void followAppTheme() {
    state = const DataSpaceAppearance(mode: ThemeBindingMode.follow);
  }

  void setCustomTheme(String themeId) {
    state = DataSpaceAppearance(
      mode: ThemeBindingMode.custom,
      customThemeId: themeId,
    );
  }
}

final dataSpaceAppearanceProvider =
    NotifierProvider.family<
      DataSpaceAppearanceController,
      DataSpaceAppearance,
      String
    >(DataSpaceAppearanceController.new);
