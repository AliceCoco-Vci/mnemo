import '../common/theme_typography.dart';

class AppTypographyTokens {
  final ThemeTypography heading;
  final ThemeTypography title;
  final ThemeTypography body;
  final ThemeTypography caption;
  final ThemeTypography button;

  const AppTypographyTokens({
    this.heading = const ThemeTypography(fontSize: 28, fontWeight: 700),
    this.title = const ThemeTypography(fontSize: 20, fontWeight: 600),
    this.body = const ThemeTypography(fontSize: 14, fontWeight: 400),
    this.caption = const ThemeTypography(fontSize: 12, fontWeight: 400),
    this.button = const ThemeTypography(fontSize: 14, fontWeight: 500),
  });
}
