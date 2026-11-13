import '../common/theme_border.dart';
import '../common/theme_color.dart';

class DataSpaceComponentTokens {
  final DataSpaceCardStyle card;
  final DataSpaceDialogStyle dialog;
  final DataSpaceTableStyle table;
  final DataSpaceButtonStyle button;
  final DataSpaceInputStyle input;

  const DataSpaceComponentTokens({
    this.card = const DataSpaceCardStyle(),
    this.dialog = const DataSpaceDialogStyle(),
    this.table = const DataSpaceTableStyle(),
    this.button = const DataSpaceButtonStyle(),
    this.input = const DataSpaceInputStyle(),
  });
}

class DataSpaceCardStyle {
  final ThemeColor background;
  final ThemeBorder border;

  const DataSpaceCardStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.border = const ThemeBorder(),
  });
}

class DataSpaceDialogStyle {
  final ThemeColor background;
  final ThemeBorder border;

  const DataSpaceDialogStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.border = const ThemeBorder(),
  });
}

class DataSpaceTableStyle {
  final ThemeColor background;
  final ThemeColor headerBackground;
  final ThemeColor rowBackground;
  final ThemeColor alternateRowBackground;

  final ThemeBorder border;

  final double rowHeight;

  const DataSpaceTableStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.headerBackground = const ThemeColor('#F8FAFC'),
    this.rowBackground = const ThemeColor('#FFFFFF'),
    this.alternateRowBackground = const ThemeColor('#F8FAFC'),
    this.border = const ThemeBorder(),
    this.rowHeight = 44,
  });
}

class DataSpaceButtonStyle {
  final ThemeColor background;
  final ThemeColor foreground;
  final ThemeBorder border;

  const DataSpaceButtonStyle({
    this.background = const ThemeColor('#6366F1'),
    this.foreground = const ThemeColor('#FFFFFF'),
    this.border = const ThemeBorder(visible: false),
  });
}

class DataSpaceInputStyle {
  final ThemeColor background;
  final ThemeColor foreground;
  final ThemeBorder border;

  const DataSpaceInputStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.foreground = const ThemeColor('#1E293B'),
    this.border = const ThemeBorder(),
  });
}
