import '../common/theme_spacing.dart';
import '../common/theme_shadow.dart';
import '../../models/theme_asset.dart';

class AppDecorationTokens {
  final ThemeSpacing spacing;
  final List<ThemeShadow> shadows;
  final ThemeWallpaper? wallpaper;

  const AppDecorationTokens({
    this.spacing = const ThemeSpacing(),
    this.shadows = const [ThemeShadow()],
    this.wallpaper,
  });
}
