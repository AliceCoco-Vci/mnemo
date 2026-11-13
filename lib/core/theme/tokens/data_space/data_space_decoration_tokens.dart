import '../common/theme_spacing.dart';
import '../common/theme_shadow.dart';
import '../../models/theme_asset.dart';

class DataSpaceDecorationTokens {
  final ThemeSpacing spacing;
  final List<ThemeShadow> shadows;
  final ThemeWallpaper? wallpaper;

  const DataSpaceDecorationTokens({
    this.spacing = const ThemeSpacing(),
    this.shadows = const [ThemeShadow()],
    this.wallpaper,
  });
}
