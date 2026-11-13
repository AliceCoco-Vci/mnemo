import 'theme_color.dart';

class ThemeBorder {
  final bool visible;
  final ThemeColor color;
  final double width;
  final double radius;

  const ThemeBorder({
    this.visible = true,
    this.color = const ThemeColor('#E5E7EB'),
    this.width = 1,
    this.radius = 8,
  });
}
