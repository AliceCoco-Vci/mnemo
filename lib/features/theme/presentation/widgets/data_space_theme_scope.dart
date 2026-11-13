import 'package:flutter/widgets.dart';

import '../../../../core/theme/adapters/data_space_theme_adapter.dart';

class DataSpaceThemeScope extends InheritedWidget {
  final DataSpaceThemeStyle style;

  const DataSpaceThemeScope({
    super.key,
    required this.style,
    required super.child,
  });

  static DataSpaceThemeStyle of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<DataSpaceThemeScope>();

    assert(scope != null, 'DataSpaceThemeScope not found in widget tree.');

    return scope!.style;
  }

  @override
  bool updateShouldNotify(DataSpaceThemeScope oldWidget) {
    return style != oldWidget.style;
  }
}
