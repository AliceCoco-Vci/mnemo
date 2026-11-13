import '../common/theme_color.dart';

class DataSpaceColorTokens {
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

  const DataSpaceColorTokens({
    this.background = const ThemeColor('#F8FAFC'),
    this.surface = const ThemeColor('#FFFFFF'),
    this.surfaceElevated = const ThemeColor('#FFFFFF'),

    this.primary = const ThemeColor('#6366F1'),
    this.secondary = const ThemeColor('#8B5CF6'),

    this.textPrimary = const ThemeColor('#1E293B'),
    this.textSecondary = const ThemeColor('#64748B'),
    this.textDisabled = const ThemeColor('#94A3B8'),

    this.divider = const ThemeColor('#E2E8F0'),
    this.error = const ThemeColor('#EF4444'),
    this.success = const ThemeColor('#10B981'),
  });
}
