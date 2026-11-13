import '../common/theme_border.dart';
import '../common/theme_color.dart';

class AppComponentTokens {
  final AppCardStyle card;
  final AppDialogStyle dialog;
  final AppNavigationStyle navigation;
  final AppButtonStyle button;
  final AppInputStyle input;

  const AppComponentTokens({
    this.card = const AppCardStyle(),
    this.dialog = const AppDialogStyle(),
    this.navigation = const AppNavigationStyle(),
    this.button = const AppButtonStyle(),
    this.input = const AppInputStyle(),
  });
}

class AppCardStyle {
  final ThemeColor background;
  final ThemeBorder border;

  const AppCardStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.border = const ThemeBorder(),
  });
}

class AppDialogStyle {
  final ThemeColor background;
  final ThemeBorder border;

  const AppDialogStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.border = const ThemeBorder(),
  });
}

class AppNavigationStyle {
  final ThemeColor background;
  final ThemeColor selectedColor;
  final ThemeColor unselectedColor;

  final ThemeBorder border;

  const AppNavigationStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.selectedColor = const ThemeColor('#6366F1'),
    this.unselectedColor = const ThemeColor('#9CA3AF'),
    this.border = const ThemeBorder(),
  });
}

class AppButtonStyle {
  final ThemeColor background;
  final ThemeColor foreground;
  final ThemeBorder border;

  const AppButtonStyle({
    this.background = const ThemeColor('#6366F1'),
    this.foreground = const ThemeColor('#FFFFFF'),
    this.border = const ThemeBorder(visible: false),
  });
}

class AppInputStyle {
  final ThemeColor background;
  final ThemeColor foreground;
  final ThemeBorder border;

  const AppInputStyle({
    this.background = const ThemeColor('#FFFFFF'),
    this.foreground = const ThemeColor('#111827'),
    this.border = const ThemeBorder(),
  });
}
