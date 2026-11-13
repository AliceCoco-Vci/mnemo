import '../common/theme_typography.dart';

class DataSpaceTypographyTokens {
  final ThemeTypography heading;
  final ThemeTypography title;
  final ThemeTypography body;
  final ThemeTypography caption;
  final ThemeTypography tableCell;

  const DataSpaceTypographyTokens({
    this.heading = const ThemeTypography(fontSize: 26, fontWeight: 700),
    this.title = const ThemeTypography(fontSize: 18, fontWeight: 600),
    this.body = const ThemeTypography(fontSize: 14, fontWeight: 400),
    this.caption = const ThemeTypography(fontSize: 12, fontWeight: 400),
    this.tableCell = const ThemeTypography(fontSize: 13, fontWeight: 400),
  });
}
