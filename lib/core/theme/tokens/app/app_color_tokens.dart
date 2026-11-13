import '../common/theme_color.dart';

class AppColorTokens {
  final ThemeColor background;
  final ThemeColor surface;
  final ThemeColor surfaceElevated;

  final ThemeColor primary;
  final ThemeColor secondary;

  final ThemeColor textPrimary;
  final ThemeColor textSecondary;
  final ThemeColor textDisabled;

  final ThemeColor divider;
  final ThemeColor error;
  final ThemeColor success;

  const AppColorTokens({
    this.background = const ThemeColor('#FFFFFF'),
    this.surface = const ThemeColor('#F9FAFB'),
    this.surfaceElevated = const ThemeColor('#FFFFFF'),

    this.primary = const ThemeColor('#6366F1'),
    this.secondary = const ThemeColor('#8B5CF6'),

    this.textPrimary = const ThemeColor('#111827'),
    this.textSecondary = const ThemeColor('#6B7280'),
    this.textDisabled = const ThemeColor('#9CA3AF'),

    this.divider = const ThemeColor('#E5E7EB'),
    this.error = const ThemeColor('#EF4444'),
    this.success = const ThemeColor('#10B981'),
  });
}
